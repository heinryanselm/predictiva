part of '../trade_content.dart';

class _TradeContentTablet extends StatelessWidget {
  const _TradeContentTablet({
    required this.trade,
  });

  final OrderModel trade;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.toH(context)),
        border: Border.all(
          color: AppColors.divider,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 28.0.toW(context),
          vertical: 32.0.toH(context),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.header(trade.title, fontSize: 16),
            AppText(trade.price),
            AppText(trade.type),
            TransactionChip(type: trade.action),
            AppText(trade.amount),
            AppText(trade.date.formatted),
          ],
        ),
      ),
    );
  }
}
