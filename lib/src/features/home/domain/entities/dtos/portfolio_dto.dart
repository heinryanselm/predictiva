class PortfolioDto {
  final num balance;
  final num profit;
  final num profitPercentage;
  final num assets;

  PortfolioDto({
    required this.balance,
    required this.profit,
    required this.profitPercentage,
    required this.assets,
  });

  factory PortfolioDto.fromJson(Map<String, dynamic> json) {
    return PortfolioDto(
      balance: json['balance'] ?? 0,
      profit: json['profit'] ?? 0,
      profitPercentage: json['profit_percentage'] ?? 0,
      assets: json['assets'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
      'profit': profit,
      'profit_percentage': profitPercentage,
      'assets': assets,
    };
  }

  PortfolioDto copyWith({
    double? balance,
    double? profit,
    double? profitPercentage,
    int? assets,
  }) {
    return PortfolioDto(
      balance: balance ?? this.balance,
      profit: profit ?? this.profit,
      profitPercentage: profitPercentage ?? this.profitPercentage,
      assets: assets ?? this.assets,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PortfolioDto &&
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
}
