import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/imports_constants.dart';
import '../../factory/transition_creator.dart';
import 'animator/size_animator.dart';
import 'option/size_animation_option.dart';

class SizeTransitionAnimation implements TransitionCreator {
  final SizeAnimationOptions options;

  const SizeTransitionAnimation({required this.options});

  @override
  Widget animate(Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return Align(
      alignment: options.alignment,
      child: SizeTransition(
        sizeFactor: SizeAnimator(options).animator(animation),
        axis: options.axis,
        axisAlignment: options.axisAlignment,
        child: child,
      ).buildSecondaryTransition(animation: animation, applySecondaryTransition: options.secondaryTransition),
    );
  }
}
