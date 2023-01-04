// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/screens/main/dashboard.dart';
import 'package:spare_wallet/screens/public/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Spare Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      getPages: [
        GetPage(name: '/', page: () => OnboardingScreen()),
        GetPage(name: '/dashboard', page: () => DashboardScreen()),
      ],
    );
  }
}
