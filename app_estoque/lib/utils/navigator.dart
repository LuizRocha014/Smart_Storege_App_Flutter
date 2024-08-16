import 'dart:async';
import 'dart:developer';
import 'package:app_estoque/utils/instance_manager.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:flutter/widgets.dart';

abstract class MStatefulWidget extends StatefulWidget {
  const MStatefulWidget({super.key});
}

abstract class MState<T extends StatefulWidget, S extends Object>
    extends State<T> with GlobalListenerMixin {
  String? identifier;
  late S controller;
  String? instanceNameTag;
  bool deleteController = true;
  @override
  void initState() {
    super.initState();
    if (identifier != null) {
      initGlobalListener(
        onAppearing,
        identifier!,
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onAppearing();
      });
    }
  }

  void registerController(S controllerInstance, {String? tag}) {
    if (S != Null) {
      if (!instanceManager.exists<S>(tag: tag)) {
        controller =
            context.registerController<S>(controllerInstance, tag: tag);
        instanceNameTag = tag;
      } else {
        controller = instanceManager.get<S>(tag: tag);
        context.assignContext<S>(tag: tag);
      }
    }
  }

  @override
  void dispose() {
    if (identifier != null) {
      disposeGlobalListener(identifier!);
    }
    if (S != Null && deleteController) {
      instanceManager.delete<S>(tag: instanceNameTag);
    }
    super.dispose();
  }

  @protected
  @mustCallSuper
  void onAppearing() {
    log('onAppearing');
  }
}

class GlobalListener {
  static final GlobalListener _instance = GlobalListener._internal();

  factory GlobalListener() {
    return _instance;
  }

  GlobalListener._internal();

  final Map<String, StreamController<void>> _listenerControllers = {};

  StreamSubscription<void> addListener(String identifier, Function() listener) {
    if (!_listenerControllers.containsKey(identifier)) {
      _listenerControllers[identifier] = StreamController<void>.broadcast();
    }
    return _listenerControllers[identifier]!.stream.listen((_) => listener());
  }

  bool findListener(String identifier) {
    return _listenerControllers.containsKey(identifier);
  }

  void removeListener(String identifier, Function(void) listener) {
    if (_listenerControllers.containsKey(identifier)) {
      _listenerControllers[identifier]!.stream.drain().then(
            (_) => _listenerControllers[identifier]!
                .stream
                .listen((_) => listener),
          );
    }
  }

  void disposeListener(String identifier) {
    if (_listenerControllers.containsKey(identifier)) {
      _listenerControllers[identifier]!.close();
      _listenerControllers.remove(identifier);
    }
  }

  void updateListener(String identifier) {
    _listenerControllers[identifier]!.add(null);
  }
}

mixin GlobalListenerMixin {
  void initGlobalListener(Function() listener, String identifier) {
    GlobalListener().addListener(
      identifier,
      listener,
    );
  }

  void disposeGlobalListener(String identifier) {
    GlobalListener().disposeListener(identifier);
  }

  void updateGlobalListener(String identifier) {
    GlobalListener().updateListener(identifier);
  }
}
