part of '../transaction_activity_card.dart';

class _TransactionActivityBuilderTablet extends StatelessWidget {
  final PortfolioModel data;
  const _TransactionActivityBuilderTablet(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 52.0.toW(context),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.divider,
            width: 1.0.toW(context),
          ),
          borderRadius: BorderRadius.circular(8.0.toW(context)),
        ),
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0.toW(context)),
                  topRight: Radius.circular(8.0.toW(context)),
                ),
                border: Border.all(
                  color: AppColors.divider,
                  width: 1.0.toW(context),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0.toH(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TXContentItem(
                      title: 'Balance',
                      value: data.balance,
                    ),
                    const AppDivider(isVertical: true),
                    TXContentItem(
                      title: 'Profits',
                      value: data.profit,
                      trailing: ProfitChip(
                        percentage: data.profitPercentage,
                        mode: IndicatorMode.up,
                      ),
                    ),
                    const AppDivider(isVertical: true),
                    TXContentItem(
                      title: 'Assets',
                      value: data.assets,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 26.0.toW(context),
                vertical: 32.0.toH(context),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    CupertinoIcons.info_circle,
                    color: AppColors.warning,
                    size: 21.5.toH(context),
                  ),
                  SizedBox(width: 8.toW(context)),
                  const Expanded(
                    child: AppText(
                      'This subscription expires in a month.',
                      fontSize: 16,
                      color: Color(0xFFF4F4F5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
