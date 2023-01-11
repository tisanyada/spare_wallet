// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStyles {
  static Color bgRed = Color(0xFFFF6565);
  static Color bgGray = Color(0xFF87898E);
  static Color bgBlack = Colors.black87;
  static Color bgPrimary = Color(0xFF2C3988);
  static Color bgSecondary = Color(0xFF407AFF);
  static Color bgGrayLight = Color(0xFFDADADA);
  static Color bgGrayShade1 = Color(0xFFDADADA);
  static Color bgGreenLight = Color(0xFF91F2C5);
}

class AppLayout {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getScreenHeight() {
    return Get.height;
  }

  static getScreenWidth() {
    return Get.width;
  }

  static getHeight(double pixels) {
    double x = getScreenHeight() / pixels;

    return getScreenHeight() / x;
  }

  static getWidth(double pixels) {
    double x = getScreenWidth() / pixels;

    return getScreenWidth() / x;
  }
}

extension PercentSized on double {
  double get hp => (Get.height * (this / 100));
  double get wp => (Get.width * (this / 100));
}

extension ResponsiveText on double {
  double get sp => Get.width / 100 * (this / 3);
}
