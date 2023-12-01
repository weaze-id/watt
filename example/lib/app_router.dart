import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:witt/witt.dart';

class AppPage {
  final String path;
  final String? title;
  final List<SingleChildWidget> Function(
    BuildContext context,
    dynamic arguments,
  )? providerBuilder;
  final Widget Function(BuildContext context, dynamic arguments) builder;

  AppPage({
    required this.path,
    this.title,
    this.providerBuilder,
    required this.builder,
  });
}

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<T?> pushNamed<T>(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static void pop<T extends Object?>({
    T? result,
    String? nestedKeyLabel,
  }) {
    navigatorKey.currentState!.pop(result);
  }

  static Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigatorKey.currentState!.popAndPushNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  static void popUntil(bool Function(Route<dynamic>) predicate) {
    return navigatorKey.currentState!.popUntil(predicate);
  }

  static Future<T?>
      pushNamedAndRemoveUntil<T extends Object?, TO extends Object?>(
    String newRouteName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }

  static Future<T?>
      pushNamedAndRemoveAll<T extends Object?, TO extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static Route<dynamic>? onGenerateRoute({
    required RouteSettings settings,
    required List<AppPage> pages,
  }) {
    for (final page in pages) {
      if (settings.name == page.path) {
        return MaterialPageRoute(
          builder: (context) => page.providerBuilder != null
              ? WMultiProvider.builder(
                  providers: page.providerBuilder!.call(
                    context,
                    settings.arguments,
                  ),
                  builder: (context) => page.builder(
                    context,
                    settings.arguments,
                  ),
                )
              : page.builder(context, settings.arguments),
          settings: settings,
        );
      }
    }

    return null;
  }
}
