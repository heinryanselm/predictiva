part of 'imports_constants.dart';

extension RouterExtension on BuildContext {
  Object? get arguments {
    try {
      return ModalRoute.of(this)?.settings.arguments;
    } catch (e) {
      log('error occurred: ${e.toString()}', name: 'RouterExtension');
      return null;
    }
  }

  Map<String, dynamic> get namedArguments {
    try {
      return ModalRoute.of(this)?.settings.arguments as Map<String, dynamic>? ??
          <String, dynamic>{};
    } catch (e) {
      log('error occurred: ${e.toString()}', name: 'RouterExtension');
      return {};
    }
  }
}
