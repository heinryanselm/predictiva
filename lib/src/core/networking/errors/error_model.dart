import 'error_type.dart';

class ErrorModel {
  String message;
  final ErrorType type;

  ErrorModel({
    required this.message,
    required this.type,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ErrorModel &&
        other.message == message &&
        other.type == type;
  }

  @override
  int get hashCode {
    return message.hashCode ^ type.hashCode;
  }

  ErrorModel copyWith({
    String? title,
    ErrorType? type,
  }) {
    return ErrorModel(
      message: title ?? message,
      type: type ?? this.type,
    );
  }
}
