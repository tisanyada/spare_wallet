// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomSearchBar({
    super.key,
    required this.hintText,
    required this.controller,
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
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(Icons.search_rounded),
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
