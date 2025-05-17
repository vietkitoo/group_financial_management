import 'package:flutter/material.dart';
import 'app_route_path.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');

    if (uri.pathSegments.isEmpty) {
      return AppRoutePath.welcome();
    }

    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments[0] == 'home') {
        return AppRoutePath.home();
      }
      if (uri.pathSegments[0] == 'welcome') {
        return AppRoutePath.welcome();
      }
    }

    return AppRoutePath.welcome(); // fallback
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) {
    if (configuration.isWelcome) {
      return const RouteInformation(location: '/welcome');
    }
    if (configuration.isHome) {
      return const RouteInformation(location: '/home');
    }
    return null;
  }
}
