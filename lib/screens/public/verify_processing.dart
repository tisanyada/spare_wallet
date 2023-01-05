import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/config/custom_colors.dart';
import 'package:spare_wallet/screens/auth/verify_success_screen.dart';

class VerifyProcessing extends StatefulWidget {
  const VerifyProcessing({super.key});

  @override
  State<VerifyProcessing> createState() => _VerifyProcessingState();
}

class _VerifyProcessingState extends State<VerifyProcessing> {
  void runTimeout() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.to(
      transition: Transition.fade,
      duration: const Duration(milliseconds: 500),
      () => const VerifySuccessScreen(),
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
      body: Center(
        child: Lottie.asset(
          'assets/animations/loading__1.json',
        ),
      ),
    );
  }
}
