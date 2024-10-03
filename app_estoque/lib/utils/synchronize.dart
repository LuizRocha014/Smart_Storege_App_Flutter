import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class Synchronism {
  Completer<void>? busy;
  RxDouble progress = 0.0.obs;
  double progressItemValue = 0.0;

  // List<IBaseServicePostAndGet> get servicePost => [];

  // List<IBaseServiceGet> get serviceGet => [
  //       // instanceManager.get<IQMAService>(),
  //       // instanceManager.get<IQMATemplateChecklistItemService>(),
  //       // instanceManager.get<IQMATemplateInstrumentoMedicaoEquipamentoService>(),
  //       // instanceManager.get<IQMATemplateUsuarioTipoMetadadoService>(),
  //       // instanceManager.get<IUsuarioQMAService>(),
  //       // instanceManager.get<IObraService>(),
  //       ...servicePost,
  //     ];

  // Future<void> fullSync({bool forcaDataAlteracaoNula = false, bool forcaSincronismo = false}) async {
  //   try {
  //     final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
  //     if (busy != null) {
  //       await busy!.future;
  //     }
  //     busy = Completer<void>();
  //     progress.value = 0.0;
  //     progressItemValue = 0.0;
  //     progressItemValue = 100 / (serviceGet.length + servicePost.length);
  //     log("Sincronismo");
  //     final sincronismoWifi = sharedPreferences.getBool("SincronismoWifi") ?? false;
  //     if (sincronismoWifi) {
  //       if (connectivityResult.contains(ConnectivityResult.wifi)) {
  //         await startSync(
  //           servicePost,
  //           forcaDataAlteracaoNula: forcaDataAlteracaoNula,
  //           forcaSincronismo: forcaSincronismo,
  //         );
  //       }
  //       throw Exception("Sincronismo é permitido apenas em wifi");
  //     } else {
  //       await startSync(
  //         servicePost,
  //         forcaDataAlteracaoNula: forcaDataAlteracaoNula,
  //         forcaSincronismo: forcaSincronismo,
  //       );
  //     }
  //     // deletaInformacoesAntigas();
  //     // checaAprPendentes();
  //     await cleanCache();
  //   } catch (e) {
  //     log(StackTrace.current.toString());
  //     log("Erro ao sincronizar: $e");
  //     if (forcaSincronismo) rethrow;
  //   } finally {
  //     busy!.complete();
  //     busy = null;
  //   }
  // }

  // //

  // Future<void> cleanCache() async {
  //   try {
  //     // Obtenha o diretório de cache
  //     final Directory cacheDirectory = await getTemporaryDirectory();
  //     final Directory appDirectory = await getApplicationDocumentsDirectory();

  //     // Liste todos os arquivos e diretórios no diretório de cache
  //     final List<FileSystemEntity> files = cacheDirectory.listSync();
  //     final List<FileSystemEntity> filesApp = appDirectory.listSync();
  //     log("--------------------------------------------------------------------\n\n\n");
  //     log("Pasta cache => ${files.length}, Pasta app => ${filesApp.length}\n\n");
  //     for (final FileSystemEntity file in files) {
  //       await file.delete(recursive: true);
  //       log("PastaCache limpa");
  //     }
  //     log("--------------------------------------------------------------------\n\n\n");
  //   } catch (_) {}
  // }

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

  // Future<void> startSync(
  //   List<IBaseServicePostAndGet>? servicesPost, {
  //   bool forcaDataAlteracaoNula = false,
  //   bool forcaSincronismo = false,
  // }) async {
  //   final listaSincronismo = <SyncDTO>[];
  //   try {
  //     final lastSincDate = DateTime.tryParse(await secureStorage.readSecureStorage('LastTimeUpdated') ?? "");
  //     if (!forcaSincronismo && lastSincDate != null && lastSincDate.difference(DateTime.now()).inMinutes.abs() < 10) {
  //       log("Sincronismo não necessário, foram ${lastSincDate.difference(DateTime.now()).inMinutes} de 10 minutos");
  //       return;
  //     }
  //     if (servicesPost != null) {
  //       for (final item in servicesPost) {
  //         log(item.runtimeType.toString());
  //         // final SyncDTO sincronismo = SyncDTO(
  //         //   inicio: DateTime.now(),
  //         //   alteracao: DateTime.now(),
  //         //   service: item.runtimeType.toString(),
  //         // );
  //         try {
  //           await item.postMethod();
  //           //sincronismo.sucesso = true;
  //           //sincronismo.mensagem = "Sincronizado com sucesso";
  //         } catch (e) {
  //           //sincronismo.sucesso = false;
  //           //sincronismo.mensagem = e.toString();
  //           throw Exception();
  //         }
  //         // sincronismo.tempoTotal = sincronismo.alteracao?.difference(sincronismo.inicio).inSeconds ?? -1;
  //         // listaSincronismo.add(sincronismo);
  //       }
  //     }
  //     await iniciarSincronismoGets(forcaDataAlteracaoNula: forcaDataAlteracaoNula);
  //     //await secureStorage.writeSecureStorage('LastTimeUpdated', DateTime.now().toString());

  //     _mostraResumoSincronismo(listaSincronismo);

  //     if (listaSincronismo.any((element) => !element.sucesso!)) throw Exception();
  //   } catch (e) {
  //     //implementar logica de erro
  //     rethrow;
  //   }
  // }

  // void _mostraResumoSincronismo(List<SyncDTO> sincronismos) {
  //   log("=============================================");
  //   sincronismos.sort((a, b) => a.tempoTotal.compareTo(b.tempoTotal));
  //   for (final item in sincronismos) {
  //     log("SincronismoDTO: ${item.service} - ${item.sucesso} - ${item.mensagem} - ${item.tempoTotal}s - Quantidade Total: ${item.quantTotal}");
  //   }
  //   log("=============================================");
  // }

  // Future<List<SyncDTO>> iniciarSincronismoGets({bool forcaDataAlteracaoNula = false}) async {
  //   try {
  //     final listaSincronismo = <SyncDTO>[];

  //     await Future.wait(
  //       serviceGet.map((item) {
  //         final SyncDTO sincronismo = SyncDTO(
  //           inicio: DateTime.now(),
  //           alteracao: DateTime.now(),
  //           service: item.runtimeType.toString(),
  //           //nomeMetodo: item.nomeMetodoGet,
  //         );
  //         return item.getAll(alteracaoNula: forcaDataAlteracaoNula).then((value) {
  //           sincronismo.sucesso = true;
  //           sincronismo.mensagem = "Sincronizado com sucesso";
  //           sincronismo.alteracao = DateTime.now();
  //           sincronismo.quantTotal = value.length;
  //           sincronismo.tempoTotal = sincronismo.alteracao?.difference(sincronismo.inicio).inSeconds ?? -1;
  //           listaSincronismo.add(sincronismo);
  //           progress.value += progressItemValue;
  //         }).onError((e, stackTrace) {
  //           sincronismo.sucesso = false;
  //           sincronismo.mensagem = e.toString();
  //           sincronismo.alteracao = DateTime.now();
  //           log("onError getAll - ${item.runtimeType}");
  //           log(e.toString());
  //           throw e!;
  //         });
  //       }),
  //     );
  //     _mostraResumoSincronismo(listaSincronismo);
  //     return listaSincronismo;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
