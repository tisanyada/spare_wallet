// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';

class CustomBorderButton extends StatelessWidget {
  final double borderRadius;
  final String text;
  final double width;
  final double height;
  final Function onTapHandler;
  final Color fontColor;
  final double fontSize;
  final Color borderColor;
  final int borderWidth;
  final FontWeight fontWeight;
  String? type;
  CustomBorderButton({
    super.key,
    this.type,
    required this.text,
    required this.width,
    required this.height,
    required this.onTapHandler,
    required this.fontSize,
    required this.fontColor,
    required this.fontWeight,
    required this.borderColor,
    required this.borderWidth,
    required this.borderRadius,
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
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(borderRadius),
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
