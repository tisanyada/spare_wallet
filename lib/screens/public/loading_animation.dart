import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:spare_wallet/screens/auth/verify_success_screen.dart';

class LoadingAnimation extends StatefulWidget {
  final Function timeoutFunction;
  const LoadingAnimation({
    super.key,
    required this.timeoutFunction,
  });

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
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

    widget.timeoutFunction();
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
