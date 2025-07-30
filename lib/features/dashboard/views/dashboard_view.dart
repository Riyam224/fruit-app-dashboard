import 'package:flutter/material.dart';
import 'package:fruit_dashboard/features/dashboard/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 229, 180),
      body: const DashboardViewBody(),
    );
  }
}
