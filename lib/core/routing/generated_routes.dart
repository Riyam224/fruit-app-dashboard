import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

class RouteGenerator {
  static GoRouter mainRoutingInOurApp = GoRouter(
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('404 Not Found'))),
    initialLocation: AppRoutes.dashboard,
    routes: [
    ]
     
  );
}
