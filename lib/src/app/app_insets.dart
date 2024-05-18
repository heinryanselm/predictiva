import 'package:flutter/material.dart';
import 'package:predictiva/src/core/extensions/responsive_x.dart';

class AppInsets {
  AppInsets._();

  static EdgeInsets defaultInsets(BuildContext context) {
    return EdgeInsets.all(20.0.toH(context));
  }

  static EdgeInsets horizontalInsets(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: 20.0.toW(context));
  }

  static EdgeInsets verticalInsets(BuildContext context) {
    return EdgeInsets.symmetric(vertical: 20.0.toH(context));
  }
}
