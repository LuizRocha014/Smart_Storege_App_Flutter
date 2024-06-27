import 'dart:developer';
import 'package:flutter/material.dart';

extension NavigationService on BuildContext {
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(Widget page, {TO? result}) async {
    return await Navigator.of(this).pushReplacement(MPageRoutes(page), result: result);
  }

  Future<dynamic> push(Widget page) async {
    return await Navigator.of(this).push(MPageRoutes(page));
  }

  Future<dynamic> pushAnimated(
    Widget page,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget) transitionsBuilder,
  ) async {
    return await Navigator.of(this).push(
      PageRouteBuilder(
        settings: RouteSettings(name: page.toString()),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: transitionsBuilder,
      ),
    );
  }

  Future<dynamic> pushAnimatedBottomToTop(
    Widget page,
  ) async {
    return pushAnimated(page, (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    });
  }

  Future<void> pop<T>([T? result]) async {
    return Navigator.of(this).pop<T>(result);
  }

  /// Pop until the route with the specified name is at the top of the navigator.
  /// [routeName] should be with the initial "/"
  void popUntil(String routeName) {
    Navigator.of(this).popUntil((route) {
      final routeName0 = route is MPageRoutes ? route.name : route.settings.name;
      log("Verificando rota: $routeName0");
      return routeName0 == routeName;
    });
  }

  /// Clear all stack and push the page
  Future<void> pushAndRemoveUntil(Widget page) async {
    await Navigator.of(this).pushAndRemoveUntil(MPageRoutes(page), (route) {
      return false;
    });
  }
}

class MPageRoutes<T> extends PageRoute<T> with MaterialRouteTransitionMixin<T> {
  @override
  final bool maintainState;
  final Widget child;
  MPageRoutes(
    this.child, {
    super.settings,
    super.fullscreenDialog,
    super.allowSnapshotting,
    super.barrierDismissible,
    this.maintainState = true,
  });

  String get name => "/${child.runtimeType}";

  @override
  Widget buildContent(BuildContext context) {
    return child;
  }
}

class RouteHistoryObserver extends NavigatorObserver {
  List<String> routeHistory = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    try {
      if (route is MPageRoutes) {
        routeHistory.add(route.name);
      } else if (route is MaterialPageRoute || route is PageRouteBuilder) {
        routeHistory.add(route.settings.name.toString());
      }
      printRouteHistory();
    } catch (e) {
      log("Erro ao incluir histórico de navegação: $e");
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    try {
      if (route is MPageRoutes || route is MaterialPageRoute || route is PageRouteBuilder) {
        routeHistory.removeLast();
      }
      printRouteHistory();
    } catch (e) {
      log("Erro ao remover histórico de navegação: $e");
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    try {
      if (route is MPageRoutes || route is MaterialPageRoute || route is PageRouteBuilder) {
        routeHistory.removeAt(0);
      }
      printRouteHistory();
    } catch (e) {
      log("Erro ao remover histórico de navegação: $e");
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    try {
      log("didReplace");
      if (newRoute is MPageRoutes) {
        routeHistory.add(newRoute.name);
      } else if (newRoute != null && (newRoute is MaterialPageRoute || newRoute is PageRouteBuilder)) {
        routeHistory.add(newRoute.settings.name.toString());
      }
      printRouteHistory();
    } catch (e) {
      log("Erro ao remover histórico de navegação: $e");
    }
  }

  void printRouteHistory() {
    log("Route History: $routeHistory", name: "Navigator");
  }
}
