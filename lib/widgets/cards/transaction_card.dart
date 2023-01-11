import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/data/index.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';

class TransactionCard extends StatelessWidget {
  final int index;
  final List data;
  const TransactionCard({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.0.hp,
      margin: data[index]['type'] == 'card'
          ? EdgeInsets.only(bottom: 2.0.hp)
          : EdgeInsets.only(bottom: 0.0.hp),
      decoration: BoxDecoration(
        color: data[index]['type'] == 'card'
            ? Colors.white
            : Colors.white.withOpacity(0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: data[index]['type'] == 'card'
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: data[index]['transaction'] == 'transfer'
                          ? AppStyles.bgPrimary.withOpacity(0.1)
                          : AppStyles.bgGreenLight.withOpacity(0.2),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: data[index]['transaction'] == 'transfer'
                            ? AppStyles.bgPrimary
                            : AppStyles.bgGreenLight,
                      ),
                    ),
                    SizedBox(width: 2.0.wp),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                          text: data[index]['title'],
                          size: 12.0.sp,
                          weight: FontWeight.w600,
                        ),
                        CustomTextWidget(
                          text: data[index]['date'],
                          size: 12.0.sp,
                          color: AppStyles.bgGray,
                        ),
                      ],
                    ),
                  ],
                ),
                CustomTextWidget(
                  text: data[index]['price'],
                  size: 12.0.sp,
                  weight: FontWeight.bold,
                  color: data[index]['price_color'],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: data[index]['title'],
                  size: 14.0.sp,
                  weight: FontWeight.w500,
                ),
              ],
            ),
    );
  }
}
