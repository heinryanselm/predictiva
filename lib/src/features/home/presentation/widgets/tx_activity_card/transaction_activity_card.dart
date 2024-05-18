import 'package:flutter/cupertino.dart';
import 'package:predictiva/src/app/app_insets.dart';
import 'package:predictiva/src/core/extensions/responsive_x.dart';
import 'package:predictiva/src/core/resources/app_colors.dart';
import 'package:predictiva/src/features/home/data/model/portfolio_model.dart';
import 'package:predictiva/src/features/home/presentation/widgets/profit_chip/profit_chip.dart';
import 'package:predictiva/src/features/home/presentation/widgets/profit_chip/utils/indicator_mode/indicator_mode.dart';
import 'package:predictiva/src/features/home/presentation/widgets/tx_content_item/t_x_content_item.dart';
import 'package:predictiva/src/shared/app_divider.dart';
import 'package:predictiva/src/shared/app_text.dart';
import 'package:predictiva/src/shared/responsive_builder.dart';

part 'mobile/transaction_activity_builder_mobile.dart';
part 'tablet/transaction_activity_builder_tablet.dart';

class TransactionActivityCard extends StatelessWidget {
  final ValueNotifier<PortfolioModel> portfolio;
  const TransactionActivityCard({
    super.key,
    required this.portfolio,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<PortfolioModel>(
      valueListenable: portfolio,
      builder: (context, data, child) {
        return ResponsiveBuilder(
          mobile: (_) => _TransactionActivityBuilderMobile(data),
          tablet: (_) => _TransactionActivityBuilderTablet(data),
        );
      },
    );
  }
}
