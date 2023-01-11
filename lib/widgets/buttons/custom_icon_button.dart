// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';

class CustomIconButton extends StatelessWidget {
  final Map data;
  const CustomIconButton({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppLayout.getHeight(80),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppStyles.bgGrayShade1.withOpacity(0.6),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(data['icon']),
                color: AppStyles.bgSecondary.withOpacity(0.8),
              ),
              SizedBox(width: 4.0.wp),
              CustomTextWidget(
                text: data['title'],
                size: 12.0.sp,
                weight: FontWeight.w500,
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
          ),
        ],
      ),
    );
  }
}
