import '../errors/error_model.dart';

abstract class Result<T> {
  final T? data;
  final String? message;

  final ErrorModel? error;

  Result({
    this.data,
    this.error,
    this.message,
  });

  factory Result.success(T? data, {String? message}) = Success<T>;

  factory Result.failed(ErrorModel? error) = Failed<T>;
}

class Success<T> extends Result<T> {
  Success(T? data, {super.message}) : super(data: data);
}

class Failed<T> extends Result<T> {
  Failed(ErrorModel? error) : super(error: error);
}

extension ResultX<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailed => this is Failed<T>;
}
