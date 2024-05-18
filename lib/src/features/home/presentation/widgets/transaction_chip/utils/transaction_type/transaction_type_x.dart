part of 'transaction_type.dart';

extension TransactionTypeX on TransactionType {
  String get label {
    switch (this) {
      case TransactionType.sell:
        return 'Sell';
      case TransactionType.buy:
        return 'Buy';
    }
  }

  Color get color {
    switch (this) {
      case TransactionType.sell:
        return AppColors.red;
      case TransactionType.buy:
        return AppColors.green;
    }
  }

  Color get backgroundColor {
    return AppColors.onSecondary.withOpacity(0.3);
  }
}

TransactionType tXFromString(String? value) {
  switch (value) {
    case 'SELL':
      return TransactionType.sell;
    case 'BUY':
      return TransactionType.buy;
    default:
      return TransactionType.sell;
  }
}
