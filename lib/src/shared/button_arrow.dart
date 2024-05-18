import 'package:flutter/material.dart';
import 'package:predictiva/src/core/extensions/responsive_x.dart';
import 'package:predictiva/src/core/resources/app_colors.dart';

class ButtonArrow extends StatelessWidget {
  const ButtonArrow({
    super.key,
    required this.icon,
    this.isDisabled = false,
    required this.onTap,
  });
  final IconData icon;
  final bool isDisabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(4.0.toW(context)),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.border,
              width: 1.0.toW(context),
            ),
            borderRadius: BorderRadius.circular(4.0.toW(context)),
          ),
          child: Icon(
            icon,
            color: isDisabled ? AppColors.disabled : AppColors.title,
            size: 16.0.toW(context),
          ),
        ),
        if (!isDisabled)
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(4.0.toW(context)),
                onTap: onTap,
              ),
            ),
          ),
      ],
    );
  }
}
