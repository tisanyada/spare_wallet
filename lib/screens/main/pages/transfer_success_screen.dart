// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/screens/main/dashboard.dart';
import 'package:spare_wallet/widgets/buttons/custom_border_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_button.dart';
import 'package:spare_wallet/widgets/buttons/row_text_button.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';

class TransferSuccessScreen extends StatefulWidget {
  final Map recipient;
  const TransferSuccessScreen({
    super.key,
    required this.recipient,
  });

  @override
  State<TransferSuccessScreen> createState() => _TransferSuccessScreenState();
}

class _TransferSuccessScreenState extends State<TransferSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.4),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: screenWidth * 0.80,
              height: screenHeight * 0.5,
              padding: EdgeInsets.symmetric(
                vertical: AppLayout.getHeight(24),
                horizontal: AppLayout.getWidth(20),
              ),
              decoration: BoxDecoration(
                // color: Colors.amber,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget(
                    text: 'You successfully sent \$170 to',
                    size: 12.0.sp,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: 2.0.hp),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          widget.recipient['image'],
                          width: 15.0.wp,
                        ),
                        CustomTextWidget(
                          text: widget.recipient['name'],
                          size: 14.0.sp,
                          weight: FontWeight.w600,
                        ),
                        SizedBox(height: 1.0.hp),
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
                              text: widget.recipient['card_initials'],
                              size: 6.0.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.0.hp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(65, (index) {
                      return Container(
                        width: 2,
                        margin: EdgeInsets.only(right: 0.5.wp),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: AppStyles.bgGray),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 2.0.hp),
                  CustomTextWidget(
                    text: 'Enjoy yourself at the movies darling',
                    size: 12.0.sp,
                    // color: Colors.white,
                  ),
                  SizedBox(height: 2.0.hp),
                  RowTextButtons(
                    leftText: 'Download Receipt',
                    rightText: 'Share',
                  ),
                  SizedBox(height: 2.0.hp),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0.wp),
                    child: Column(
                      children: [
                        CustomButton(
                          text: 'Done',
                          width: double.maxFinite,
                          height: 6.0.hp,
                          onTapHandler: () {
                            // CALL SIGNUP FUNCTION
                            Get.to(
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 500),
                              () => DashboardScreen(),
                            );
                          },
                          fontSize: 14.0.sp,
                          borderRadius: 50,
                          fontColor: Colors.white,
                          fontWeight: FontWeight.bold,
                          backgroundColor: AppStyles.bgSecondary,
                        ),
                        SizedBox(height: 2.0.hp),
                        CustomBorderButton(
                          text: 'Send More',
                          width: double.maxFinite,
                          height: 6.0.hp,
                          onTapHandler: () {
                            // Get.to(
                            //   transition: Transition.rightToLeft,
                            //   duration: const Duration(milliseconds: 500),
                            //   () => SignupScreen(),
                            // );
                          },
                          fontSize: 14.0.sp,
                          borderRadius: 50,
                          borderColor: AppStyles.bgSecondary,
                          borderWidth: 1,
                          fontColor: AppStyles.bgPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: 15.0.hp,
              child: Container(
                width: 20,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 15.0.hp,
              child: Container(
                width: 20,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
