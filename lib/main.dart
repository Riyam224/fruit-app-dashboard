import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/routing/generated_routes.dart';

void main() {
  runApp(const FruitDashboardApp());
}

class FruitDashboardApp extends StatelessWidget {
  const FruitDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        primaryColor: const Color(0xff4BAA50),
      ),
      routerConfig: RouteGenerator.mainRoutingInOurApp,
    );
  }
}
