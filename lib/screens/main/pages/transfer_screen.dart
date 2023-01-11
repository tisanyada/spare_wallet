// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/screens/main/pages/transfer_success_screen.dart';
import 'package:spare_wallet/screens/public/loading_animation.dart';
import 'package:spare_wallet/widgets/buttons/custom_button.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';
import 'package:spare_wallet/widgets/utils/custom_text_header.dart';
import 'package:spare_wallet/widgets/utils/wallet_balance.dart';

class TransferScreen extends StatefulWidget {
  final Map recipient;
  const TransferScreen({
    super.key,
    required this.recipient,
  });

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  TextEditingController amountController = TextEditingController();

  void runTimeout() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.to(
      transition: Transition.fade,
      duration: const Duration(milliseconds: 500),
      () => TransferSuccessScreen(recipient: widget.recipient),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.0.hp),
              CustomTextHeader(title: 'Transfer'),
              SizedBox(height: 2.0.hp),
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          widget.recipient['image'],
                          width: 15.0.wp,
                        ),
                        Positioned(
                          left: 4.0.wp,
                          bottom: 0,
                          child: Container(
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
                        ),
                      ],
                    ),
                    CustomTextWidget(
                      text: widget.recipient['name'],
                      size: 14.0.sp,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.0.hp),
              Center(
                child: SizedBox(
                  width: 40.0.wp,
                  height: 6.0.hp,
                  // color: Colors.red,
                  child: TextFormField(
                    controller: amountController,
                    textAlignVertical: TextAlignVertical.center,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(5),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '\$',
                      contentPadding: EdgeInsets.all(10),
                      hintStyle: TextStyle(
                        color: AppStyles.bgGray,
                        fontSize: 30.0.sp,
                      ),
                    ),
                    style: TextStyle(
                      color: AppStyles.bgBlack,
                      fontSize: 30.0.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.0.hp),
              WalletBalance(),
              SizedBox(height: 2.0.hp),
              CustomButton(
                text: 'Send',
                width: double.maxFinite,
                height: 6.0.hp,
                onTapHandler: () {
                  // CALL ONTAP FUNCTION
                  Get.to(
                    transition: Transition.zoom,
                    duration: const Duration(milliseconds: 500),
                    () => LoadingAnimation(timeoutFunction: runTimeout),
                  );
                },
                fontSize: 12.0.sp,
                borderRadius: 50,
                fontColor: Colors.white,
                fontWeight: FontWeight.bold,
                backgroundColor: AppStyles.bgSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
