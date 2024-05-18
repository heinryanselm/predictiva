import 'package:flutter/material.dart';
import 'package:predictiva/src/core/extensions/context_x.dart';
import 'package:predictiva/src/core/extensions/responsive_x.dart';
import 'package:predictiva/src/core/resources/app_colors.dart';
import 'package:predictiva/src/features/home/data/model/order_model.dart';
import 'package:predictiva/src/features/home/presentation/controller/home_controller.dart';
import 'package:predictiva/src/features/home/presentation/widgets/open_trades/open_trades_card.dart';
import 'package:predictiva/src/shared/app_divider.dart';
import 'package:predictiva/src/shared/app_error_widget.dart';
import 'package:predictiva/src/shared/app_loader.dart';
import 'package:predictiva/src/shared/app_text.dart';
import 'package:predictiva/src/shared/button_arrow.dart';

import '../../../../app/app_insets.dart';
import 'trade_content/trade_content.dart';
import 'tx_activity_card/transaction_activity_card.dart';

part 'home_body.dart';
part 'home_header.dart';
part 'home_top_bar.dart';
part 'trade_content_builder.dart';
part 'trade_keys_builder.dart';
