// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';

class CustomFormTextField extends StatelessWidget {
  final String hintText;
  ImageIcon? prefixIcon;
  TextEditingController? controller;
  TextInputType? keyboardType;
  CustomFormTextField({
    super.key,
    this.prefixIcon,
    this.controller,
    this.keyboardType,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 6.0.hp,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppStyles.bgGrayShade1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller ?? controller,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: keyboardType != null ? keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          contentPadding: EdgeInsets.all(10),
          prefixIcon: prefixIcon ?? prefixIcon,
          hintStyle: TextStyle(
            color: AppStyles.bgGray,
          ),
        ),
        style: TextStyle(
          color: AppStyles.bgBlack,
        ),
      ),
    );
  }
}
