part of 'params.dart';

class NoResponse {
  NoResponse._();

  factory NoResponse() => _instance;
  static final NoResponse _instance = NoResponse._();
}

extension NullResponseExtension on NoResponse? {
  NoResponse get orNull => this ?? NoResponse();
}
