// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';

class CustomFormPasswordField extends StatefulWidget {
  final String hintText;
  bool showPassword;
  ImageIcon? prefixIcon;
  final ImageIcon? suffixIcon;
  TextEditingController? controller;
  CustomFormPasswordField({
    super.key,
    this.prefixIcon,
    required this.suffixIcon,
    required this.showPassword,
    this.controller,
    required this.hintText,
  });

  @override
  State<CustomFormPasswordField> createState() =>
      _CustomFormPasswordFieldState();
}

class _CustomFormPasswordFieldState extends State<CustomFormPasswordField> {
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
        obscureText: widget.showPassword ? widget.showPassword : false,
        controller: widget.controller ?? widget.controller,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          contentPadding: EdgeInsets.all(10),
          prefixIcon: widget.prefixIcon ?? widget.prefixIcon,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.showPassword = !widget.showPassword;
              });
            },
            child: widget.suffixIcon,
          ),
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
