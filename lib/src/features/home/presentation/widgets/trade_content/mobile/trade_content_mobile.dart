part of '../trade_content.dart';

class _TradeContentMobile extends StatelessWidget {
  const _TradeContentMobile({
    required this.trade,
  });

  final OrderModel trade;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppText.header(
              trade.title,
              fontSize: 16,
            ),
            const Spacer(),
            AppText(
              trade.amount,
              fontSize: 16,
              color: AppColors.title,
            ),
          ],
        ),
        SizedBox(height: 4.0.toH(context)),
        Row(
          children: [
            TransactionChip(type: trade.action),
            const Spacer(),
            AppText(
              trade.date.formatted,
              fontSize: 16,
              color: AppColors.subTitle,
            ),
          ],
        ),
      ],
    );
  }
}
