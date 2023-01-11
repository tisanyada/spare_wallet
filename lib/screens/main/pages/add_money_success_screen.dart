// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/screens/main/pages/add_money_screen.dart';
import 'package:spare_wallet/widgets/buttons/custom_border_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_button.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';
import 'package:spare_wallet/widgets/utils/custom_text_header.dart';

class AddMoneySuccessScreen extends StatefulWidget {
  const AddMoneySuccessScreen({super.key});

  @override
  State<AddMoneySuccessScreen> createState() => _AddMoneySuccessScreenState();
}

class _AddMoneySuccessScreenState extends State<AddMoneySuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          margin: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(24),
          ),
          // color: Colors.amber,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4.0.hp),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/success__1.png'),
                  ),
                  SizedBox(height: 10.0.hp),
                  Center(
                    child: Column(
                      children: [
                        CustomTextWidget(
                          text: 'Yaaayyyyy!',
                          size: 18.0.sp,
                          color: AppStyles.bgSecondary,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(height: 2.0.hp),
                        Container(
                          width: 50.0.wp,
                          child: CustomTextWidget(
                            text:
                                'You have successfully added \$826 to your spare account',
                            size: 14.0.sp,
                            alignment: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0.hp),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 4.0.hp),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        text: 'Done',
                        width: double.maxFinite,
                        height: 6.0.hp,
                        onTapHandler: () {
                          // CALL ONTAP FUNCTION
                          Get.toNamed('/dashboard');
                        },
                        fontSize: 12.0.sp,
                        borderRadius: 50,
                        fontColor: Colors.white,
                        fontWeight: FontWeight.bold,
                        backgroundColor: AppStyles.bgPrimary,
                      ),
                      SizedBox(height: 1.0.hp),
                      CustomBorderButton(
                        text: 'Add More Money',
                        width: double.maxFinite,
                        height: 6.0.hp,
                        onTapHandler: () {
                          Get.to(
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 500),
                            () => AddMoneyScreen(),
                          );
                        },
                        fontSize: 12.0.sp,
                        borderRadius: 50,
                        borderColor: AppStyles.bgPrimary,
                        borderWidth: 1,
                        fontColor: AppStyles.bgPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
