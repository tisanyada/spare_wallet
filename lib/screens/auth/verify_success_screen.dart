// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/screens/auth/signin_screen.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';

class VerifySuccessScreen extends StatefulWidget {
  const VerifySuccessScreen({super.key});

  @override
  State<VerifySuccessScreen> createState() => _VerifySuccessScreenState();
}

class _VerifySuccessScreenState extends State<VerifySuccessScreen> {
  void runTimeout() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.to(
      transition: Transition.fade,
      duration: const Duration(milliseconds: 500),
      () => const SigninScreen(),
    );
  }

  @override
  void initState() {
    super.initState();

    runTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(24),
        ),
        // color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/verify__success.png'),
              SizedBox(height: 5.0.hp),
              Column(
                children: [
                  CustomTextWidget(
                    text: 'Congratulations',
                    size: 18.0.sp,
                    color: AppStyles.bgSecondary,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: 2.0.hp),
                  SizedBox(
                    width: 40.0.wp,
                    child: CustomTextWidget(
                      text: 'You have successfully created your spare account',
                      size: 12.0.sp,
                      color: AppStyles.bgGray,
                      alignment: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
