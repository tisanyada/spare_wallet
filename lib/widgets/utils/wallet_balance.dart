import 'package:flutter/material.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';
import 'package:spare_wallet/config/app_config.dart';

class WalletBalance extends StatelessWidget {
  const WalletBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset('assets/images/logo__2.png'),
            SizedBox(width: 4.0.wp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: 'Spare balance',
                  size: 12.0.sp,
                  weight: FontWeight.w500,
                  color: AppStyles.bgSecondary,
                ),
                CustomTextWidget(
                  text: '\$ 5,760.19',
                  size: 12.0.sp,
                  weight: FontWeight.w600,
                  color: AppStyles.bgGray,
                ),
              ],
            ),
          ],
        ),
        Container(
          width: 14.0.wp,
          height: 3.0.hp,
          padding: EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 1.0.wp,
          ),
          decoration: BoxDecoration(
            color: AppStyles.bgSecondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: CustomTextWidget(
              text: '**4552',
              size: 10.0.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
