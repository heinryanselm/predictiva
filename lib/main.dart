import 'package:flutter/material.dart';
import 'package:predictiva/src/app/app_initializer.dart';

import 'src/app/my_app.dart';

Future<void> main() async {
  await AppInitializer().initializeApp();
  runApp(const MyApp());
}
