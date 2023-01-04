// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentButton = 'Trending'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
