import 'package:flutter/material.dart';
import 'package:predictiva/src/core/extensions/responsive_x.dart';

import '../core/resources/app_colors.dart';

class AppDivider extends StatelessWidget {
  final double? height;
  final double? width;
  final bool isVertical;
  final EdgeInsetsGeometry? padding;

  const AppDivider({
    super.key,
    this.height,
    this.width,
    this.isVertical = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !isVertical,
      replacement: Container(
        width: 1.0.toW(context),
        height: 52.0.toH(context),
        color: AppColors.divider,
      ),
      child: Padding(
        padding: padding ??
            EdgeInsetsDirectional.only(
              end: 20.0.toW(context),
            ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.toH(context)),
          child: Divider(
            height: height,
            thickness: 1.toH(context),
            color: AppColors.divider,
          ),
        ),
      ),
    );
  }
}
