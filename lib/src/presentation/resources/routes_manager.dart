import 'package:flutter/material.dart';
import 'package:simple_auth/src/presentation/views/home.dart';
import 'package:simple_auth/src/presentation/views/login.dart';
import 'package:simple_auth/src/presentation/views/splash.dart';

import 'strings_manager.dart';

class Routes {
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
  static const String splashRoute = "/";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) =>  LoginView());

      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());

        case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
