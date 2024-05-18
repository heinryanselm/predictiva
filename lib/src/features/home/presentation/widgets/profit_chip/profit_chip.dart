import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:predictiva/src/core/extensions/responsive_x.dart';
import 'package:predictiva/src/shared/app_text.dart';

import 'utils/indicator_mode/indicator_mode.dart';

class ProfitChip extends StatelessWidget {
  final String percentage;
  final IndicatorMode mode;
  const ProfitChip({
    super.key,
    required this.percentage,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0.toW(context)),
        border: Border.all(
          color: mode.color,
          width: 1.0.toW(context),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0.toW(context),
          vertical: 4.0.toH(context),
        ),
        child: Row(
          children: [
            Icon(
              mode.icon,
              color: mode.color,
              size: 16.0.toW(context),
            ),
            SizedBox(width: 4.0.toW(context)),
            AppText(
              percentage,
              color: mode.color,
              fontSize: 14.0,
            ),
          ],
        ),
      ),
    );
  }
}
