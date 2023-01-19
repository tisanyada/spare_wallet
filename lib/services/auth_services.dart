// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spare_wallet/archive/user_repository.dart';
import 'package:spare_wallet/config/api_client.dart';
import 'package:spare_wallet/config/api_config.dart';
import 'package:spare_wallet/models/user_model.dart';
import 'package:spare_wallet/screens/auth/signin_screen.dart';
import 'package:spare_wallet/screens/auth/verify_phone_screen.dart';
import 'package:spare_wallet/screens/main/dashboard.dart';

class AuthServices extends GetxController {
  final dio = DioConfig().api;
  final authStorage = GetStorage();
  final UserRepository userRepository = Get.find();

  // STATE VARIABLES
  var authLoading = false.obs;
  var authRequestError = ''.obs;
  var authRequestStatus = ''.obs;

  Future<void> signinController(
    Map dto,
  ) async {
    try {
      authLoading.value = true;
      authRequestStatus.value = 'PENDING';
      final response = await dio.post(
        '${APIConstants.backendServerUrl}auth/signin',
        data: dto,
      );

      if (response.statusCode == 200) {
        authStorage.write('USER', response.data['user']);
        authStorage.write('ACCESSTOKEN', response.data['access']);
        authStorage.write('REFRESHTOKEN', response.data['refresh']);

        userRepository.userData.value =
            UserModel.fromJson(response.data['user']);

        authLoading.value = false;
        authRequestError.value = '';
        authRequestStatus.value = 'SUCCESS';

        if (!response.data['user']['is_verified']) {
          authRequestError.value = 'ACCOUNT UNVERIFIED';
        } else {
          Get.to(
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 500),
            () => DashboardScreen(),
          );
        }
      } else {
        debugPrint('[SIGNIN ERROR] ${response.data}');
      }
    } catch (error) {
      if (error is DioError) {
        authLoading.value = false;
        authRequestStatus.value = 'FAILED';
        debugPrint('${error.response!.data}');
        if (error.response!.data['message'] != null) {
          authRequestError.value = error.response!.data['message'];
        }
        debugPrint('[SIGNIN CATCH ERROR] ${error.response!.data}');
      }
    }
  }

  Future<void> signupController(
    Map dto,
  ) async {
    try {
      authLoading.value = true;
      authRequestStatus.value = 'PENDING';
      final response = await dio.post(
        '${APIConstants.backendServerUrl}auth/signup',
        data: dto,
      );

      if (response.statusCode == 201) {
        authLoading.value = false;
        authRequestError.value = '';
        authRequestStatus.value = 'SUCCESS';
        debugPrint('[SIGNUP SUCCESS]');
        debugPrint('[SIGNUP RESPONSE]:: ${response.data}');

        Get.to(
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 500),
          () => VerifyPhoneScreen(
            phone: response.data['phone'].substring(1),
          ),
        );
      }
    } catch (error) {
      if (error is DioError) {
        authLoading.value = false;
        authRequestStatus.value = 'FAILED';
        debugPrint('[SIGNUP CATCH ERROR] ${error.response!.data}');
        if (error.response!.data['email'] != null) {
          authRequestError.value = error.response!.data['email'][0];
        }
        if (error.response!.data['message'] != null) {
          authRequestError.value = error.response!.data['message'];
        }
      }
    }
  }

  Future<void> activateAccountController(
    Map dto,
  ) async {
    try {
      authLoading.value = true;
      authRequestStatus.value = 'PENDING';
      final response = await dio.patch(
        '${APIConstants.backendServerUrl}auth/activate_account',
        data: dto,
      );

      if (response.statusCode == 200) {
        authLoading.value = false;
        authRequestError.value = '';
        authRequestStatus.value = 'SUCCESS';
        debugPrint('[ACTIVATE_ACCOUNT SUCCESS]');
        debugPrint('[ACTIVATE_ACCOUNT RESPONSE]:: ${response.data}');

        Get.to(
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 500),
          () => VerifyPhoneScreen(
            phone: response.data['phone'].substring(1),
          ),
        );
      }
    } catch (error) {
      if (error is DioError) {
        authLoading.value = false;
        authRequestStatus.value = 'FAILED';
        debugPrint('[ACTIVATE_ACCOUNT CATCH ERROR] ${error.response!.data}');
        if (error.response!.data['error'] != null) {
          authRequestError.value = 'Invalid token, please try again';
        }
      }
    }
  }

  Future<void> logoutController() async {
    try {
      authStorage.erase();

      Get.to(
        transition: Transition.zoom,
        duration: const Duration(milliseconds: 500),
        () => SigninScreen(),
      );
    } catch (error) {
      debugPrint('$error :: an error occured');
    }
  }
}
