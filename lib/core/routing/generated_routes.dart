import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/routing/app_routes.dart';
import 'package:fruit_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruit_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:go_router/go_router.dart';

class RouteGenerator {
  static GoRouter mainRoutingInOurApp = GoRouter(
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('404 Not Found'))),
    initialLocation: AppRoutes.dashboard,
    routes: [
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) => const DashboardView(),
      ),
      GoRoute(
        path: AppRoutes.addProduct,
        builder: (context, state) => const AddProductView(),
      ),
    ],
  );
}
