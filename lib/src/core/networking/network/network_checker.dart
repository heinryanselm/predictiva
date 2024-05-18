import 'dart:developer';
import 'dart:io';

class NetworkChecker {
  static const String _host = 'google.com';

  Future<bool> get isConnected async {
    try {
      final result = await InternetAddress.lookup(_host);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      log('No internet connection', name: 'NetworkChecker');
      return false;
    }
    return false;
  }
}
