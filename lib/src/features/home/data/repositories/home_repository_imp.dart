import 'package:predictiva/src/features/home/data/data_sources/home_data_source.dart';
import 'package:predictiva/src/features/home/data/model/order_model.dart';
import 'package:predictiva/src/features/home/domain/entities/mappers/order_mapper.dart';
import 'package:predictiva/src/features/home/domain/entities/mappers/portflio_mapper.dart';
import 'package:predictiva/src/features/home/domain/repositories/home_repository.dart';

import '../../../../core/networking/result/result.dart';
import '../data_sources/home_data_source_impl.dart';
import '../model/portfolio_model.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeDataSource _dataSource = HomeDataSourceImp();

  @override
  Future<Result<PortfolioModel>> getPortfolio() async {
    final result = await _dataSource.getPortfolio();
    if (result.isSuccess) {
      return Result.success(result.data.toModel(), message: result.message);
    } else {
      return Result.failed(result.error);
    }
  }

  @override
  Future<Result<List<OrderModel>>> getOrders() async {
    final result = await _dataSource.getOrders();
    if (result.isSuccess) {
      final orders = result.data?.map((e) => e.toModel()).toList();
      return Result.success(orders, message: result.message);
    } else {
      return Result.failed(result.error);
    }
  }
}
