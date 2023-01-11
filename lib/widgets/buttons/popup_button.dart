// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/data/index.dart';
import 'package:spare_wallet/screens/main/pages/bills_services_screen.dart';
import 'package:spare_wallet/screens/main/pages/send_to_spare_user_screen.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';

class PopupButton extends StatelessWidget {
  final int index;
  final BuildContext modalContext;
  const PopupButton({
    super.key,
    required this.index,
    required this.modalContext,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (popupButtons[index]['page'] == 'send') {
          Navigator.pop(modalContext);
          Get.to(
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 500),
            () => SendToSpareUserScreen(),
          );
        }
        if (popupButtons[index]['page'] == 'pay') {
          Navigator.pop(modalContext);
          Get.to(
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 500),
            () => BillsAndServicesScreen(),
          );
        }
      },
      child: Container(
        height: AppLayout.getHeight(80),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppStyles.bgGrayShade1.withOpacity(0.6),
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(popupButtons[index]['icon']),
              color: AppStyles.bgSecondary.withOpacity(0.8),
            ),
            SizedBox(width: 4.0.wp),
            CustomTextWidget(
              text: popupButtons[index]['title'],
              size: 12.0.sp,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
