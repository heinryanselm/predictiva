import 'package:predictiva/src/features/home/presentation/widgets/transaction_chip/utils/transaction_type/transaction_type.dart';

import '../../../data/model/order_model.dart';
import '../dtos/order_dto.dart';

extension OrderMapperX on OrderDto {
  OrderModel toModel() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(creationTime * 1000);
    return OrderModel(
      title: symbol,
      type: type,
      action: tXFromString(side),
      amount: '$quantity',
      date: dateTime,
      price: '$price',
    );
  }
}
