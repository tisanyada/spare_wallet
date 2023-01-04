// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var currentButton = 'Trending'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
