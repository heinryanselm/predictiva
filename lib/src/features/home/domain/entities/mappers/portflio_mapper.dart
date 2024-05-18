import 'package:predictiva/src/features/home/data/model/portfolio_model.dart';

import '../dtos/portfolio_dto.dart';

extension PortfolioMapperX on PortfolioDto? {
  PortfolioDto empty() {
    return PortfolioDto(
      assets: 0,
      balance: 0,
      profit: 0,
      profitPercentage: 0,
    );
  }

  PortfolioModel toModel() {
    final assets = this?.assets ?? 0;
    final balance = this?.balance ?? 0;
    final profit = this?.profit ?? 0;
    final profitPercentage = this?.profitPercentage ?? 0;
    return PortfolioModel(
      assets: '$assets',
      balance: '$balance',
      profit: '$profit',
      profitPercentage: '$profitPercentage%',
    );
  }
}
