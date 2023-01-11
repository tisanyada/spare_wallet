// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/data/index.dart';
import 'package:spare_wallet/screens/main/pages/transfer_screen.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';

class RecipientCard extends StatefulWidget {
  final int index;
  const RecipientCard({
    super.key,
    required this.index,
  });

  @override
  State<RecipientCard> createState() => _RecipientCardState();
}

class _RecipientCardState extends State<RecipientCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 500),
          () => TransferScreen(
            recipient: recipients[widget.index],
          ),
        );
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(recipients[widget.index]['image']),
                SizedBox(width: 4.0.wp),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: recipients[widget.index]['name'],
                      size: 12.0.sp,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(height: AppLayout.getHeight(2)),
                    Container(
                      width: 8.0.wp,
                      // height: 20,
                      padding: EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 1.0.wp,
                      ),
                      decoration: BoxDecoration(
                        color: AppStyles.bgGray,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: CustomTextWidget(
                          text: recipients[widget.index]['card_initials'],
                          size: 6.0.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.keyboard_arrow_right,
            ),
          ],
        ),
      ),
    );
  }
}
