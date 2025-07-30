import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/custom_widgets/custom_btn.dart';
import 'package:fruit_dashboard/core/routing/app_routes.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';
import 'package:go_router/go_router.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomBtn(
          color: AppColors.lightPrimaryColor,
          text: 'add product',
          onTap: () {
            GoRouter.of(context).go(AppRoutes.addProduct);
          },
        ),
      ],
    );
  }
}
