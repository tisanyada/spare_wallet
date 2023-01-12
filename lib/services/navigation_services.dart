// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spare_wallet/screens/public/onboarding_screen.dart';
import 'package:spare_wallet/screens/public/splash_screen.dart';

class NavigationServices {
  final authStorage = GetStorage();

  logOut() {
    try {

      Get.to(
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 500),
        () => OnboardingScreen(),
      );

      authStorage.remove('USER');
      authStorage.remove('ACCESSTOKEN');
    } catch (error) {
      debugPrint('$error :: an error occured');
    }
  }
}
