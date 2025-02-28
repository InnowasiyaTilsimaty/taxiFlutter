import 'dart:io';

import 'package:dio/dio.dart';

import '../../configs/app_url.dart';
import '../../data/json_http_client.dart';
import '../../main.dart';
import '../auth/auth_service.dart';

class HttpClientService {
  final JsonHttpClient httpClient;

  HttpClientService({JsonHttpClient? httpClientInstance})
      : httpClient = httpClientInstance ?? JsonHttpClient() {
    httpClient.dio.options.baseUrl = AppUrl.baseUrl;
    httpClient.dio.interceptors.addAll(
      [
        InterceptorsWrapper(
          onRequest: (options, handler) {
            final authToken = getIt<AuthService>().getUser()?.token;
            if (authToken != null) {
              options.headers[HttpHeaders.authorizationHeader] = 'Bearer $authToken';
            }
            return handler.next(options);
          },
        ),
      ],
    );
  }
}
