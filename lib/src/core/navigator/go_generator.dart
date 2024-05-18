import 'package:flutter/material.dart';

import 'named_routes.dart';
import 'page_router/imports_page_router_builder.dart';

class GoGenerator {
  GoGenerator._();

  static final PageRouterBuilder _pageRouter = PageRouterBuilder();

  static Route<dynamic> getRoute(RouteSettings settings) {
    final namedRoute = NamedRoutes.values.firstWhere(
      (e) => e.routeName == settings.name,
    );
    switch (namedRoute) {
      case NamedRoutes.home:
        return _pageRouter.build(
          const Scaffold(
            body: Center(
              child: Text('Home Page'),
            ),
          ),
        );

      default:
        return undefineRoute();
    }
  }

  static Route<dynamic> undefineRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('No route exists here ! '),
        ),
      ),
    );
  }
}
