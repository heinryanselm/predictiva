import 'package:flutter/material.dart';
import 'package:predictiva/src/core/extensions/context_x.dart';
import 'package:predictiva/src/core/extensions/responsive_x.dart';
import 'package:predictiva/src/core/resources/app_colors.dart';
import 'package:predictiva/src/features/home/data/model/order_model.dart';
import 'package:predictiva/src/features/home/presentation/widgets/dialogs/filter_table_dialog.dart';
import 'package:predictiva/src/features/home/presentation/widgets/imports_widgets_home.dart';
import 'package:predictiva/src/shared/app_text.dart';
import 'package:predictiva/src/shared/responsive_builder.dart';

import '../../../../../shared/app_divider.dart';

class OpenTradesCard extends StatelessWidget {
  const OpenTradesCard({
    super.key,
    required this.orders,
  });

  final ValueNotifier<List<OrderModel>> orders;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<OrderModel>>(
      valueListenable: orders,
      builder: (context, orders, child) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 24.0.toH(context),
            horizontal:
                context.isMobile ? 20.0.toW(context) : 52.0.toW(context),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              border: Border.all(
                color: AppColors.divider,
                width: 1.0.toW(context),
              ),
              borderRadius: BorderRadius.circular(8.0.toW(context)),
            ),
            child: Padding(
              padding: context.isMobile
                  ? EdgeInsets.all(16.0.toH(context))
                  : EdgeInsets.symmetric(
                      vertical: 30.0.toH(context),
                      horizontal: 30.0.toW(context),
                    ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppText.header(
                        'Open trades',
                        fontSize: 18,
                      ),
                      const Spacer(),
                      // filter icon with border 8
                      InkWell(
                        borderRadius: BorderRadius.circular(8.0.toW(context)),
                        child: Container(
                          padding: EdgeInsets.all(4.0.toW(context)),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.divider,
                              width: 1.0.toW(context),
                            ),
                            borderRadius:
                                BorderRadius.circular(8.0.toW(context)),
                          ),
                          child: Icon(
                            Icons.filter_list,
                            color: AppColors.title,
                            size: 24.0.toW(context),
                          ),
                        ),
                        onTap: () {
                          // open dialog

                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: FilterTableDialog(
                                  symbols: orders.map((e) => e.title).toList(),
                                  onApply: (selectedSymbol, price, startDate,
                                      endDate) {
                                    // filter logic
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  ResponsiveBuilder(
                    mobile: (context) {
                      return Column(
                        children: [
                          SizedBox(height: 10.toH(context)),
                          const AppDivider(),
                        ],
                      );
                    },
                    tablet: (context) {
                      return Column(
                        children: [
                          SizedBox(height: 20.toH(context)),
                          const TradeKeysBuilder(),
                        ],
                      );
                    },
                  ),
                  TradeContentBuilder(orders: orders),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
