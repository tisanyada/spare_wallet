// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';

class CustomLoadingButton extends StatelessWidget {
  final double borderRadius;
  final double width;
  final double height;
  Color? borderColor;
  final Color backgroundColor;
  String? type;
  CustomLoadingButton({
    super.key,
    this.type,
    this.borderColor,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: type == 'list'
          ? EdgeInsets.only(right: AppLayout.getWidth(10))
          : EdgeInsets.all(0),
      padding: EdgeInsets.symmetric(vertical: 1.0.hp),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
