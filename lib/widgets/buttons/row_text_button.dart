// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';

class RowTextButtons extends StatelessWidget {
  final String leftText;
  final String rightText;
  const RowTextButtons({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage('assets/icons/icon__arrow__down.png'),
              color: AppStyles.bgSecondary.withOpacity(0.8),
            ),
            SizedBox(width: 2.0.wp),
            CustomTextWidget(
              text: leftText,
              size: 12.0.sp,
              weight: FontWeight.w500,
              color: AppStyles.bgSecondary,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage('assets/icons/icon__share.png'),
              color: AppStyles.bgSecondary.withOpacity(0.8),
            ),
            SizedBox(width: 2.0.wp),
            CustomTextWidget(
              text: rightText,
              size: 12.0.sp,
              weight: FontWeight.w500,
              color: AppStyles.bgSecondary,
            ),
          ],
        ),
      ],
    );
  }
}
