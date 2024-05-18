abstract class Failure {
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure;
  }

  @override
  int get hashCode => 0;
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
