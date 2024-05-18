import 'package:flutter/services.dart';

class AppLayout {
  AppLayout._();

  static Future<void> fixedOrientation() {
    List<DeviceOrientation> orientations = [DeviceOrientation.portraitUp];
    return SystemChrome.setPreferredOrientations(orientations);
  }
}
