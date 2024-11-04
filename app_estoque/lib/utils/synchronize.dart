import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:app_estoque/base/service/interface/ibase_service_get.dart';
import 'package:app_estoque/base/service/interface/ibase_service_get_post.dart';
import 'package:app_estoque/base/service/interface/icategory_service.dart';
import 'package:app_estoque/base/service/interface/icostumer_service.dart';
import 'package:app_estoque/base/service/interface/ipermission_service.dart';
import 'package:app_estoque/base/service/interface/ishop_costumer_service.dart';
import 'package:app_estoque/base/service/interface/ishop_product_service.dart';
import 'package:app_estoque/base/service/interface/ishop_service.dart';
import 'package:app_estoque/base/service/interface/ishop_user_service.dart';
import 'package:app_estoque/base/service/interface/iuser_permission_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Synchronism {
  Completer<void>? busy;
  RxDouble progress = 0.0.obs;
  double progressItemValue = 0.0;

  List<IBaseServiceGetGetAndPost> get servicePost => [
        instanceManager.get<ICostumerService>(),
        instanceManager.get<IShopCostumerService>()
      ];

  List<IBaseServiceGet> get serviceGet => [
        instanceManager.get<IUserPermissionService>(),
        instanceManager.get<IPermissionService>(),
        instanceManager.get<ICategoryService>(),
        instanceManager.get<IShopProductService>(),
        instanceManager.get<IShopUserService>(),
        instanceManager.get<IShopService>(),
        // instanceManager.get<IProductFileService>(),
        // instanceManager.get<IFileService>(),
        ...servicePost,
      ];

  Future<void> fullSync(
      {bool forcaDataAlteracaoNula = false,
      bool forcaSincronismo = false}) async {
    try {
      if (busy != null) {
        await busy!.future;
      }
      busy = Completer<void>();
      progress.value = 0.0;
      progressItemValue = 0.0;
      progressItemValue = 100 / (serviceGet.length + servicePost.length);
      log("Sincronismo");
      await startSync(
        servicePost,
        forcaDataAlteracaoNula: forcaDataAlteracaoNula,
        forcaSincronismo: forcaSincronismo,
      );
      // deletaInformacoesAntigas();
      // checaAprPendentes();
      await cleanCache();
    } catch (e) {
      log(StackTrace.current.toString());
      log("Erro ao sincronizar: $e");
      if (forcaSincronismo) rethrow;
    } finally {
      busy!.complete();
      busy = null;
    }
  }

  //

  Future<void> cleanCache() async {
    try {
      // Obtenha o diretório de cache
      final Directory cacheDirectory = await getTemporaryDirectory();
      final Directory appDirectory = await getApplicationDocumentsDirectory();

      // Liste todos os arquivos e diretórios no diretório de cache
      final List<FileSystemEntity> files = cacheDirectory.listSync();
      final List<FileSystemEntity> filesApp = appDirectory.listSync();
      log("--------------------------------------------------------------------\n\n\n");
      log("Pasta cache => ${files.length}, Pasta app => ${filesApp.length}\n\n");
      for (final FileSystemEntity file in files) {
        await file.delete(recursive: true);
        log("PastaCache limpa");
      }
      log("--------------------------------------------------------------------\n\n\n");
    } catch (_) {}
  }

  // // void deletaInformacoesAntigas() {
  // //   final tabelas = [];
  // //   tabelas.add(instanceManager.get<IAnalisePreliminarRiscoRepository>().infosTableDatabase.tableName);
  // //   tabelas.add(instanceManager.get<IAnexoAprRepository>().infosTableDatabase.tableName);
  // //   tabelas.add(instanceManager.get<IArquivoRepository>().infosTableDatabase.tableName);
  // //   tabelas.add(instanceManager.get<IAssinaturaAprRepository>().infosTableDatabase.tableName);
  // //   tabelas.add(instanceManager.get<IAprRiscoCausaConsequenciaFonteMedidaRepository>().infosTableDatabase.tableName);
  // //   tabelas.add(instanceManager.get<IAprTipoRiscoRepository>().infosTableDatabase.tableName);
  // //   tabelas.add(instanceManager.get<IExecutanteAprRepository>().infosTableDatabase.tableName);
  // //   tabelas.add(instanceManager.get<IAprEtapaServicoRepository>().infosTableDatabase.tableName);
  // //   final context = instanceManager.get<IContext>();
  // //   final data = DateTime.now().subtract(const Duration(days: 90)).toIso8601String();
  // //   for (final tabela in tabelas) {
  // //     context.rawQuery("DELETE FROM $tabela WHERE dataAcao < '$data'");
  // //     log("Limpando tabela: $tabela - menores que data: $data");
  // //   }
  // //   context.rawQuery('''
  // //   DELETE FROM ${instanceManager.get<IObraRepository>().infosTableDatabase.tableName}
  // //   WHERE id NOT IN
  // //   (SELECT obraId FROM ${instanceManager.get<IAnalisePreliminarRiscoRepository>().infosTableDatabase.tableName})

  // //   ''');
  // //   log("Limpando tabela Obra sem analise preliminar risco vinculada");
  // // }

  Future<void> startSync(
    List<IBaseServiceGetGetAndPost>? servicesPost, {
    bool forcaDataAlteracaoNula = false,
    bool forcaSincronismo = false,
  }) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    try {
      final lastSincDate = DateTime.tryParse(
          sharedPreferences.getString('LastTimeUpdated') ?? "");
      if (!forcaSincronismo &&
          lastSincDate != null &&
          lastSincDate.difference(DateTime.now()).inMinutes.abs() < 10) {
        log("Sincronismo não necessário, foram ${lastSincDate.difference(DateTime.now()).inMinutes} de 10 minutos");
        return;
      }
      if (servicesPost != null) {
        for (final item in servicesPost) {
          log(item.runtimeType.toString());
          // final SyncDTO sincronismo = SyncDTO(
          //   inicio: DateTime.now(),
          //   alteracao: DateTime.now(),
          //   service: item.runtimeType.toString(),
          // );
          try {
            await item.postMethod();
            //sincronismo.sucesso = true;
            //sincronismo.mensagem = "Sincronizado com sucesso";
          } catch (e) {
            //sincronismo.sucesso = false;
            //sincronismo.mensagem = e.toString();
            throw Exception();
          }
          // sincronismo.tempoTotal = sincronismo.alteracao?.difference(sincronismo.inicio).inSeconds ?? -1;
          // listaSincronismo.add(sincronismo);
        }
      }
      await iniciarSincronismoGets(
          forcaDataAlteracaoNula: forcaDataAlteracaoNula);
      //await secureStorage.writeSecureStorage('LastTimeUpdated', DateTime.now().toString());
    } catch (e) {
      //implementar logica de erro
      rethrow;
    }
  }

  // void _mostraResumoSincronismo(List<SyncDTO> sincronismos) {
  //   log("=============================================");
  //   sincronismos.sort((a, b) => a.tempoTotal.compareTo(b.tempoTotal));
  //   for (final item in sincronismos) {
  //     log("SincronismoDTO: ${item.service} - ${item.sucesso} - ${item.mensagem} - ${item.tempoTotal}s - Quantidade Total: ${item.quantTotal}");
  //   }
  //   log("=============================================");
  // }

  Future<void> iniciarSincronismoGets(
      {bool forcaDataAlteracaoNula = false}) async {
    try {
      await Future.wait(
        serviceGet.map((item) {
          return item.getAll().then((value) {
            progress.value += progressItemValue;
          }).onError((e, stackTrace) {
            log("onError getAll - ${item.runtimeType}");
            log(e.toString());
            throw e!;
          });
        }),
      );
    } catch (e) {
      rethrow;
    }
  }
}
