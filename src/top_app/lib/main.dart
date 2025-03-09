import 'package:flutter/material.dart';
import 'package:top_app/core/di/injector.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_theme.dart';

void main() {
  configureDependencies();
  final appRouter = AppRouter();
  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TOP App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: appRouter.config(),
    );
  }
}
