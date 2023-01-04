// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  var currentButton = 'Trending'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Messages'),
      ),
    );
  }
}
