// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/widgets/buttons/popup_button.dart';

class SendPopupScreen extends StatefulWidget {
  final BuildContext modalContext;
  const SendPopupScreen({
    super.key,
    required this.modalContext,
  });

  @override
  State<SendPopupScreen> createState() => _SendPopupScreenState();
}

class _SendPopupScreenState extends State<SendPopupScreen> {
  @override
  Widget build(BuildContext modalContext) {
    return Container(
      height: 40.0.hp,
      padding: EdgeInsets.symmetric(
        vertical: AppLayout.getHeight(30),
        horizontal: AppLayout.getWidth(18),
      ),
      decoration: BoxDecoration(
        // color: Colors.amber,
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: List.generate(3, (index) {
          return PopupButton(index: index, modalContext: modalContext);
        }),
      ),
    );
  }
}
