// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spare_wallet/widgets/buttons/circular_back_button.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';
import 'package:spare_wallet/config/app_config.dart';

class CustomTextHeader extends StatelessWidget {
  final String title;
  const CustomTextHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularBackButton(),
        CustomTextWidget(
          text: title,
          size: 14.0.sp,
          weight: FontWeight.w500,
        ),
        Container(),
      ],
    );
  }
}
