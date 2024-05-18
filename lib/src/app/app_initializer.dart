import 'package:flutter/material.dart';

import 'app_layout.dart';

class AppInitializer {
  AppInitializer._();

  factory AppInitializer() => _instance;
  static final AppInitializer _instance = AppInitializer._();
  Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppLayout.fixedOrientation();
  }
}
