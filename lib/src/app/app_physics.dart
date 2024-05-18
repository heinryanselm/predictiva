import 'dart:ui';

import 'package:flutter/material.dart';

class AppPhysics {
  AppPhysics._();

  static final defaultPhysics = const ScrollBehavior().copyWith(
    dragDevices: {
      PointerDeviceKind.touch,
      PointerDeviceKind.mouse,
      PointerDeviceKind.stylus,
      PointerDeviceKind.trackpad
    },
    physics: const BouncingScrollPhysics(),
  );

  static const alwaysScrollablePhysics =
      AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics());
  static const bouncingPhysics = BouncingScrollPhysics();
  static const neverScrollable = NeverScrollableScrollPhysics();
}
