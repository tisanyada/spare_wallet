import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/screens/public/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void runTimeout() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.to(
      transition: Transition.fade,
      duration: const Duration(milliseconds: 500),
      () => const OnboardingScreen(),
    );
  }

  @override
  void initState() {
    super.initState();

    runTimeout();
  }

  @override
  Widget build(BuildContext context) {
    // runTimeout();
    
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/splash.png'),
      ),
    );
  }
}
