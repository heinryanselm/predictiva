import 'package:flutter/material.dart';
import 'package:predictiva/src/core/extensions/date_x.dart';
import 'package:predictiva/src/core/extensions/responsive_x.dart';
import 'package:predictiva/src/core/resources/app_colors.dart';
import 'package:predictiva/src/features/home/data/model/order_model.dart';
import 'package:predictiva/src/shared/app_text.dart';
import 'package:predictiva/src/shared/responsive_builder.dart';

import '../transaction_chip/transaction_chip.dart';

part 'mobile/trade_content_mobile.dart';
part 'tablet/trade_content_tablet.dart';

class TradeContent extends StatelessWidget {
  const TradeContent({
    super.key,
    required this.trade,
  });
  final OrderModel trade;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: (context) => _TradeContentMobile(trade: trade),
      tablet: (context) => _TradeContentTablet(trade: trade),
    );
  }
}
