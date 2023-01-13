// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spare_wallet/archive/user_repository.dart';
import 'package:spare_wallet/config/api_client.dart';
import 'package:spare_wallet/config/api_config.dart';
import 'package:spare_wallet/models/home_screen_model.dart';
import 'package:spare_wallet/models/wallet_screen_model.dart';

class UserServices extends GetxController {
  final dio = DioConfig().api;
  final authStorage = GetStorage();
  final UserRepository userRepository = Get.find();

  // STATE VARIABLES
  var userLoading = false.obs;
  var userRequestError = ''.obs;
  var userRequestStatus = ''.obs;

  Future<void> fetchHomeDataController() async {
    try {
      userLoading.value = true;
      userRequestStatus.value = 'PENDING';
      final response = await dio.get(
        '${APIConstants.backendServerUrl}user/home',
        options: Options(
          headers: {
            'Authorization': authStorage.read('ACCESSTOKEN'),
          },
        ),
      );

      if (response.statusCode == 200) {
        debugPrint('[HOMEDATA RESPONSE] ${response.data}');

        userRepository.homeData.value = HomeScreenModel.fromJson(response.data);
      }
    } catch (error) {
      if (error is DioError) {
        userLoading.value = false;
        userRequestStatus.value = 'FAILED';
        debugPrint('[HOMEDATA CATCH ERROR] ${error.response!.data}');
      }
    }
  }

  Future<void> fetchWalletDataController() async {
    try {
      userLoading.value = true;
      userRequestStatus.value = 'PENDING';
      final response = await dio.get(
        '${APIConstants.backendServerUrl}user/wallet',
        options: Options(
          headers: {
            'Authorization': authStorage.read('ACCESSTOKEN'),
          },
        ),
      );

      if (response.statusCode == 200) {
        debugPrint('[WALLETDATA RESPONSE] ${response.data}');

        userRepository.walletData.value =
            WalletScreenModel.fromJson(response.data);
      }
    } catch (error) {
      if (error is DioError) {
        userLoading.value = false;
        userRequestStatus.value = 'FAILED';
        debugPrint('[WALLETDATA CATCH ERROR] ${error.response!.data}');
      }
    }
  }
}
