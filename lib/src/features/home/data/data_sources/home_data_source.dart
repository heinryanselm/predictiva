import 'package:predictiva/src/core/networking/result/result.dart';

import '../../domain/entities/dtos/order_dto.dart';
import '../../domain/entities/dtos/portfolio_dto.dart';

abstract class HomeDataSource {
  Future<Result<PortfolioDto>> getPortfolio();
  Future<Result<List<OrderDto>>> getOrders();
}
