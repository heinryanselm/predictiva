import 'package:flutter/material.dart';
import 'package:predictiva/src/core/extensions/responsive_x.dart';
import 'package:predictiva/src/features/home/presentation/widgets/transaction_chip/utils/transaction_type/transaction_type.dart';

import '../../../../../shared/app_text.dart';

class TransactionChip extends StatelessWidget {
  final TransactionType type;
  const TransactionChip({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type.backgroundColor,
        borderRadius: BorderRadius.circular(100.0.toW(context)),
        border: Border.all(
          color: type.color,
          width: 1.0.toW(context),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0.toW(context),
          vertical: 4.0.toH(context),
        ),
        child: AppText(
          type.label,
          color: type.color,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
