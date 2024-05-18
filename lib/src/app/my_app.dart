import 'package:flutter/material.dart';
import 'package:predictiva/src/app/app_physics.dart';
import 'package:predictiva/src/core/navigator/navigator.dart';
import 'package:predictiva/src/core/themes/app_theme.dart';
import 'package:predictiva/src/features/home/presentation/pages/imports_home_page.dart';

import '../core/resources/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Go.navigatorKey,
      scrollBehavior: AppPhysics.defaultPhysics,
      title: AppStrings.appName,
      themeMode: ThemeMode.dark,
      theme: AppTheme.get,
      home: const HomePage(),
    );
  }
}
