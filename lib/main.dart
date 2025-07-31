import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/routing/generated_routes.dart';
import 'package:fruit_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruit_dashboard/core/services/get_it_service.dart';
import 'package:fruit_dashboard/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();

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
