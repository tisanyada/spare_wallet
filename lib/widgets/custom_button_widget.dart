// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/widgets/custom_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Function onTapHandler;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Color backgroundColor;
  String? type;
  CustomButtonWidget({
    super.key,
    this.type,
    required this.text,
    required this.width,
    required this.height,
    required this.onTapHandler,
    required this.fontSize,
    required this.fontColor,
    required this.fontWeight,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapHandler();
      },
      child: Container(
        width: width,
        height: height,
        margin: type == 'list'
            ? EdgeInsets.only(right: AppLayout.getWidth(10))
            : EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: CustomTextWidget(
            text: text,
            color: fontColor,
            size: fontSize,
            weight: fontWeight,
          ),
        ),
      ),
    );
  }
}
