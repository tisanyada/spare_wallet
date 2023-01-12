// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spare_wallet/config/api_config.dart';
import 'package:spare_wallet/services/navigation_services.dart';

class DioConfig {
  Dio api = Dio();
  String? accessToken;

  final authStorage = GetStorage();
  final NavigationServices navigationServices = NavigationServices();

  DioConfig() {
    api.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // accessToken = authStorage.read('ACCESSTOKEN');

        // options.headers['Authorization'] = accessToken;
        return handler.next(options);
      },
      onError: (DioError error, handler) async {
        final refreshtoken = await authStorage.read('REFRESHTOKEN');

        // debugPrint('${error.response?.data['detail']} :::++ error');
  
        if (error.response?.statusCode == 401) {
          if (!JwtDecoder.isExpired(refreshtoken)) {
            await refreshToken();
            // debugPrint('request::  ${error.requestOptions.headers}');

            return handler.resolve(await _retry(error.requestOptions));
          } else {
            navigationServices.logOut();
          }
        }

        return handler.next(error);
      },
    ));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final accessToken = await authStorage.read('ACCESSTOKEN');
    // debugPrint('new token :: $accessToken');

    final options = Options(
      method: requestOptions.method,
      headers: {'Authorization': accessToken},
      // headers: requestOptions.headers,
    );

    return api.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<void> refreshToken() async {
    final dio = Dio();
    final refreshToken = await authStorage.read('REFRESHTOKEN');

    // debugPrint('is expired :: ${JwtDecoder.isExpired(refreshToken)} \n $refreshToken');

    final response = await dio.post(
      '${APIConstants.backendServerUrl}auth/refresh_token',
      data: {
        'refresh': refreshToken,
      },
    );

    if (response.statusCode == 200) {
      accessToken = response.data['access'];
      // debugPrint('new token :: $accessToken');
      authStorage.write('ACCESSTOKEN', "Bearer ${response.data['access']}");
    }
  }
}
