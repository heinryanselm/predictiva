import 'package:predictiva/src/features/home/presentation/widgets/transaction_chip/utils/transaction_type/transaction_type.dart';

class OrderModel {
  final String title;
  final String type;
  final TransactionType action;
  final String amount;
  final DateTime date;
  final String price;

  OrderModel({
    required this.title,
    required this.type,
    required this.action,
    required this.amount,
    required this.date,
    required this.price,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
        other.title == title &&
        other.type == type &&
        other.action == action &&
        other.amount == amount &&
        other.date == date &&
        other.price == price;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        type.hashCode ^
        action.hashCode ^
        amount.hashCode ^
        date.hashCode ^
        price.hashCode;
  }

  @override
  String toString() {
    return 'OrderModel(symbol: $title, type: $type, side: $action, quantity: $amount, creationTime: $date, price: $price)';
  }

  static List<OrderModel> fake = [
    OrderModel(
        title: "DOTUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "0.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709567270 * 1000),
        price: "10.356"),
    OrderModel(
        title: "ETHUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "0.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709567270 * 1000),
        price: "11.168"),
    OrderModel(
        title: "MINAUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "0.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709567270 * 1000),
        price: "10.66"),
    OrderModel(
        title: "FETUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "0.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709567270 * 1000),
        price: "12.183"),
    OrderModel(
        title: "SOLUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "0.98",
        date: DateTime.fromMillisecondsSinceEpoch(1708567270 * 1000),
        price: "11.675"),
    OrderModel(
        title: "APTUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "0.98",
        date: DateTime.fromMillisecondsSinceEpoch(1708566560 * 1000),
        price: "10.356"),
    OrderModel(
        title: "BTCUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "13.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709563450 * 1000),
        price: "11.168"),
    OrderModel(
        title: "OKBUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "15.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709567890 * 1000),
        price: "10.66"),
    OrderModel(
      title: "STXUSDT",
      type: "LMT",
      action: TransactionType.sell,
      amount: "0.9",
      date: DateTime.fromMillisecondsSinceEpoch(1709556270 * 1000),
      price: "12.183",
    ),
    OrderModel(
        title: "FETUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "0.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709245270 * 1000),
        price: "11.675"),
    OrderModel(
        title: "MINAUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "1.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709567270 * 1000),
        price: "10.376"),
    OrderModel(
        title: "FILUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "2.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709547270 * 1000),
        price: "11.168"),
    OrderModel(
        title: "ETHUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "3.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709567240 * 1000),
        price: "16.66"),
    OrderModel(
        title: "CHRUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "5.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709567270 * 1000),
        price: "12.183"),
    OrderModel(
        title: "MINAUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "2.93",
        date: DateTime.fromMillisecondsSinceEpoch(1708547270 * 1000),
        price: "11.675"),
    OrderModel(
        title: "ETHUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "5.48",
        date: DateTime.fromMillisecondsSinceEpoch(1706677270 * 1000),
        price: "32.46"),
    OrderModel(
        title: "BTCUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "0.28",
        date: DateTime.fromMillisecondsSinceEpoch(1709567270 * 1000),
        price: "14.168"),
    OrderModel(
        title: "LINKUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "0.48",
        date: DateTime.fromMillisecondsSinceEpoch(1709567270 * 1000),
        price: "10.66"),
    OrderModel(
        title: "SHIBUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "4.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709567270 * 1000),
        price: "12.183"),
    OrderModel(
        title: "TRXUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "0.98",
        date: DateTime.fromMillisecondsSinceEpoch(1704567270 * 1000),
        price: "15.675"),
    OrderModel(
        title: "BCHUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "0.19",
        date: DateTime.fromMillisecondsSinceEpoch(1707367270 * 1000),
        price: "10.356"),
    OrderModel(
        title: "NEARUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "1.238",
        date: DateTime.fromMillisecondsSinceEpoch(1709267270 * 1000),
        price: "11.168"),
    OrderModel(
        title: "MATICUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "0.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709567270 * 1000),
        price: "10.66"),
    OrderModel(
        title: "ATOMUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "0.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709567270 * 1000),
        price: "12.183"),
    OrderModel(
        title: "MNTUSDT",
        type: "LMT",
        action: TransactionType.sell,
        amount: "0.98",
        date: DateTime.fromMillisecondsSinceEpoch(1709567270 * 1000),
        price: "11.675"),
  ];
}
