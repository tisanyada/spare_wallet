import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';

class CircularBackButton extends StatelessWidget {
  const CircularBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: CircleAvatar(
        radius: 15,
        backgroundColor: AppStyles.bgPrimary.withOpacity(0.1),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppStyles.bgPrimary,
          size: 15,
        ),
      ),
    );
  }
}
