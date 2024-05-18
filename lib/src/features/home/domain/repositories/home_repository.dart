import 'package:predictiva/src/core/networking/result/result.dart';
import 'package:predictiva/src/features/home/data/model/order_model.dart';
import 'package:predictiva/src/features/home/data/model/portfolio_model.dart';

abstract class HomeRepository {
  Future<Result<PortfolioModel>> getPortfolio();
  Future<Result<List<OrderModel>>> getOrders();
}
