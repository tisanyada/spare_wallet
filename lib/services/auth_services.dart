// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spare_wallet/config/api_client.dart';
import 'package:spare_wallet/config/api_config.dart';
import 'package:spare_wallet/screens/auth/signin_screen.dart';

class AuthServices extends GetxController {
  final API = DioConfig().api;
  final authStorage = GetStorage();

  Future<void> testDIO() async {
    try {
      final response =
          await API.get('https://jsonplaceholder.typicode.com/todos/1');

      debugPrint("$response.data :: DIO test");
    } catch (error) {
      debugPrint('$error :: an error occured');
    }
  }

  Future<void> login() async {
    try {
      final response = await API.post(
        '${APIConstants.backendServerUrl}auth/signin',
        data: {
          "email": 'tisanyada@gmail.com',
          'password': 'Martins2906',
        },
      );

      if (response.statusCode == 200) {
        // debugPrint("$response.data :: DIO login");
        debugPrint(":: DIO login");
        authStorage.write('ACCESSTOKEN', response.data['access']);
        authStorage.write('REFRESHTOKEN', response.data['refresh']);
      }
    } catch (error) {
      debugPrint('${error.toString()} :: an error occured');
    }
  }

  Future<void> getMe() async {
    try {
      final response = await API.get(
        '${APIConstants.backendServerUrl}auth/me',
        options: Options(
          headers: {'Authorization': await authStorage.read('ACCESSTOKEN')},
        ),
      );

      debugPrint("$response.data :: DIO me");
    } catch (error) {
      debugPrint('$error :: an error occured');
    }
  }

  Future<void> logOut() async {
    try {
      authStorage.erase();

      Get.to(
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 500),
        () => SigninScreen(),
      );
    } catch (error) {
      debugPrint('$error :: an error occured');
    }
  }
}
