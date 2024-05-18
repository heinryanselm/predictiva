import 'package:predictiva/src/core/networking/network/api_names.dart';
import 'package:predictiva/src/core/networking/network/network_helper.dart';
import 'package:predictiva/src/core/networking/result/result.dart';
import 'package:predictiva/src/features/home/data/data_sources/home_data_source.dart';
import 'package:predictiva/src/features/home/domain/entities/dtos/order_dto.dart';

import '../../../../core/networking/network/crud_type.dart';
import '../../domain/entities/dtos/portfolio_dto.dart';

class HomeDataSourceImp extends HomeDataSource {
  final HttpClientHelper _client = HttpClientHelper();

  @override
  Future<Result<List<OrderDto>>> getOrders() async {
    final response = await _client.call(
      ApiNames.orders,
      type: CrudType.get,
    );
    final data = response.data['data']['orders'];

    if (response.isSuccess) {
      final orders = List<OrderDto>.from(
        data.map((order) => OrderDto.fromJson(order as Map<String, dynamic>)),
      );
      return Result.success(orders, message: response.message);
    } else {
      return Result.failed(response.error);
    }
  }

  @override
  Future<Result<PortfolioDto>> getPortfolio() async {
    final response = await _client.call(
      ApiNames.portfolio,
      type: CrudType.get,
    );
    final data = response.data['data']['portfolio'];
    if (response.isSuccess) {
      final portfolio = PortfolioDto.fromJson(data);
      return Result.success(portfolio, message: response.message);
    } else {
      return Result.failed(response.error);
    }
  }
}
