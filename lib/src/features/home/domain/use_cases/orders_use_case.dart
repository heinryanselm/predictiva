import 'package:predictiva/src/core/networking/params/params.dart';
import 'package:predictiva/src/core/networking/result/result.dart';
import 'package:predictiva/src/core/networking/usecases/usecase.dart';
import 'package:predictiva/src/features/home/data/model/order_model.dart';
import 'package:predictiva/src/features/home/data/repositories/home_repository_imp.dart';
import 'package:predictiva/src/features/home/domain/repositories/home_repository.dart';

class OrdersUseCase extends UseCase<List<OrderModel>, NoParams> {
  final HomeRepository _repository = HomeRepositoryImp();

  @override
  Future<Result<List<OrderModel>>> call({NoParams? params}) {
    return _repository.getOrders();
  }
}
