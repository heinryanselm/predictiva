import 'package:flutter/material.dart';
import 'package:predictiva/src/core/extensions/responsive_x.dart';
import 'package:predictiva/src/shared/app_text.dart';

class TXContentItem extends StatelessWidget {
  final String title;
  final String value;
  final Widget? trailing;

  const TXContentItem({
    super.key,
    required this.title,
    required this.value,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.subTitle(title),
        SizedBox(height: 8.0.toH(context)),
        Row(
          children: [
            AppText.header(
              value,
              fontSize: 20.0,
            ),
            if (trailing != null) ...[
              SizedBox(width: 8.0.toW(context)),
              trailing!,
            ],
          ],
        ),
      ],
    );
  }
}
