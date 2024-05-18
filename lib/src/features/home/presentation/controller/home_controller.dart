import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:predictiva/src/core/networking/errors/error_model.dart';
import 'package:predictiva/src/core/networking/result/result.dart';
import 'package:predictiva/src/features/home/data/model/order_model.dart';
import 'package:predictiva/src/features/home/data/model/portfolio_model.dart';
import 'package:predictiva/src/features/home/domain/use_cases/portfolio_use_case.dart';

import '../../domain/use_cases/orders_use_case.dart';

enum HomeState { loading, success, error, initial }

class HomeController {
  factory HomeController() => _singleton;
  HomeController._();
  static final HomeController _singleton = HomeController._();

  final _ordersUseCase = OrdersUseCase();
  final _portfolioUseCase = PortfolioUseCase();

  final ValueNotifier<HomeState> _state = ValueNotifier(HomeState.initial);
  ValueNotifier<HomeState> get state => _state;

  final ValueNotifier<PortfolioModel> _portfolio =
      ValueNotifier(PortfolioModel.empty());
  final ValueNotifier<List<OrderModel>> _orders = ValueNotifier([]);
  ValueNotifier<PortfolioModel> get portfolio => _portfolio;
  ValueNotifier<List<OrderModel>> get orders => _orders;

  Future<void> getData() async {
    _state.value = HomeState.loading;
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      await Future.delayed(const Duration(seconds: 2));
      _portfolio.value = PortfolioModel.fake();
      _orders.value = OrderModel.fake;
      _state.value = HomeState.success;
      return;
    }
    final data = await Future.wait([
      _fetchPortfolio(),
      _fetchOrders(),
    ]);
    if (data.every((element) => element == null)) {
      _state.value = HomeState.success;
    } else {
      _state.value = HomeState.error;
      //TODO: handle error here
    }
  }

  Future<void> onRefresh() async {
    await getData();
  }

  Future<ErrorModel?> _fetchPortfolio() async {
    final result = await _portfolioUseCase();
    if (result.isSuccess && result.data != null) {
      _portfolio.value = result.data!;
      return null;
    }

    return result.error;
  }

  Future<ErrorModel?> _fetchOrders() async {
    final result = await _ordersUseCase();
    if (result.isSuccess && result.data != null) {
      _orders.value = result.data!;
      return null;
    }
    return result.error;
  }

  void init() {
    getData();
  }
}
