import '../result/result.dart';

abstract class UseCase<T, P> {
  Future<Result<T>> call({P? params});
}
