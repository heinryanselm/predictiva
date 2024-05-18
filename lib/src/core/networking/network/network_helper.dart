import 'dart:convert';
import 'dart:io';

import '../errors/error_model.dart';
import '../errors/error_type.dart';
import '../result/result.dart';
import 'crud_type.dart';
import 'network_checker.dart';

class HttpClientHelper {
  final NetworkChecker _networkChecker = NetworkChecker();
  final HttpClient _httpClient = HttpClient();

  Future<Result<dynamic>> call(
    String url, {
    required CrudType type,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final isNetworkAvailable = await _networkChecker.isConnected;
    if (!isNetworkAvailable) {
      return Result.failed(
        ErrorModel(
          message: 'No internet connection',
          type: ErrorType.networkConnection,
        ),
      );
    }
    if (!Uri.parse(url).isAbsolute) {
      return Result.failed(
        ErrorModel(
          message: 'Invalid URL: No host specified in URI $url',
          type: ErrorType.serverSide,
        ),
      );
    }

    try {
      final uri = Uri.parse(url).replace(queryParameters: queryParameters);
      HttpClientRequest request;

      switch (type) {
        case CrudType.get:
        default:
          request = await _httpClient.getUrl(uri);
          break;
      }
      headers?.forEach((key, value) {
        request.headers.add(key, value);
      });

      final response = await request.close();
      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created ||
          response.statusCode == HttpStatus.accepted) {
        final jsonString = await response.transform(utf8.decoder).join();
        final data = jsonDecode(jsonString);

        return Result.success(data,
            message: data['status']['msg'] ?? 'success');
      } else {
        return Result.failed(
          ErrorModel(
            message: 'Server side error',
            type: ErrorType.serverSide,
          ),
        );
      }
    } on HttpException catch (e) {
      return Result.failed(
        ErrorModel(
          message: e.message,
          type: ErrorType.serverSide,
        ),
      );
    }
  }
}
