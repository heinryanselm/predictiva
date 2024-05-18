class PortfolioModel {
  final String balance;
  final String profit;
  final String profitPercentage;
  final String assets;

  PortfolioModel({
    required this.balance,
    required this.profit,
    required this.profitPercentage,
    required this.assets,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PortfolioModel &&
        other.balance == balance &&
        other.profit == profit &&
        other.profitPercentage == profitPercentage &&
        other.assets == assets;
  }

  @override
  int get hashCode {
    return balance.hashCode ^
        profit.hashCode ^
        profitPercentage.hashCode ^
        assets.hashCode;
  }

  @override
  String toString() {
    return 'PortfolioModel(balance: $balance, profit: $profit, profitPercentage: $profitPercentage, assets: $assets)';
  }

  factory PortfolioModel.empty() {
    return PortfolioModel(
      balance: '0',
      profit: '0',
      profitPercentage: '0%',
      assets: '0',
    );
  }

  factory PortfolioModel.fake() {
    return PortfolioModel(
      balance: '6500.8161',
      profit: '135.5308',
      profitPercentage: '30%',
      assets: '24',
    );
  }
}
