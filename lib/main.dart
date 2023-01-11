// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spare_wallet/config/custom_colors.dart';
import 'package:spare_wallet/screens/auth/signin_screen.dart';
import 'package:spare_wallet/screens/auth/signup_screen.dart';
import 'package:spare_wallet/screens/main/dashboard.dart';
import 'package:spare_wallet/screens/main/pages/bills_services_screen.dart';
import 'package:spare_wallet/screens/public/onboarding_screen.dart';
import 'package:spare_wallet/screens/public/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Spare Wallet',
      theme: ThemeData(
        primarySwatch: ColorGenerator.createMaterialColor(Color(0xFF407AFF)),
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,
      home: authStorage.read('current_screen') == 'ONBOARDING'
          ? OnboardingScreen()
          : authStorage.read('current_screen') == 'AUTH'
              ? SigninScreen()
              : SplashScreen(),
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/onboarding', page: () => OnboardingScreen()),
        GetPage(name: '/dashboard', page: () => DashboardScreen()),
        GetPage(name: '/signup', page: () => SignupScreen()),
        GetPage(name: '/signin', page: () => SigninScreen()),
        GetPage(name: '/bills_services', page: () => BillsAndServicesScreen()),
      ],
    );
  }
}
