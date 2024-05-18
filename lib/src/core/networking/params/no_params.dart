part of 'params.dart';

class NoParams extends Params {
  factory NoParams() => _instance;
  NoParams._internal();
  static final NoParams _instance = NoParams._internal();
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

extension ParamsExtension on Params? {
  Params get orNull => this ?? NoParams();
}
