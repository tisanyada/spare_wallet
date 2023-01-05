// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/screens/public/verify_processing.dart';
import 'package:spare_wallet/widgets/buttons/circular_back_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_button.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';

class VerifyPhoneScreen extends StatefulWidget {
  const VerifyPhoneScreen({super.key});

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(24),
          ),
          // color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.0.hp),
              CircularBackButton(),
              SizedBox(height: 1.0.hp),
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/verify__phone.png'),
              ),
              SizedBox(height: 10.0.hp),
              Center(
                child: Column(
                  children: [
                    CustomTextWidget(
                      text: 'OTP Verification',
                      size: 18.0.sp,
                      color: AppStyles.bgBlack,
                      weight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                          text: 'Enter the OTP sent to ',
                          size: 12.0.sp,
                          color: AppStyles.bgGray,
                        ),
                        CustomTextWidget(
                          text: '+234-7087139241',
                          size: 12.0.sp,
                          color: AppStyles.bgBlack,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0.hp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 68,
                    width: 63,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(
                          fontSize: 16.0.sp,
                        ),
                      ),
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 63,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      decoration: InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(
                          fontSize: 16.0.sp,
                        ),
                      ),
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 63,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      decoration: InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(
                          fontSize: 16.0.sp,
                        ),
                      ),
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 63,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          // FocusScope.of(context).nextFocus();
                        } else {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      decoration: InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(
                          fontSize: 16.0.sp,
                        ),
                      ),
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0.hp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget(
                    text: 'Didn’t recieve an OTP? ',
                    size: 12.0.sp,
                    color: AppStyles.bgGray,
                  ),
                  CustomTextWidget(
                    text: 'Resend OTP',
                    size: 12.0.sp,
                    color: AppStyles.bgRed,
                  ),
                ],
              ),
              SizedBox(height: 10.0.hp),
              CustomButton(
                text: 'Verify',
                width: double.maxFinite,
                height: 6.0.hp,
                onTapHandler: () {
                  // CALL VERIFY PHONE FUNCTION
                  Get.to(
                    transition: Transition.zoom,
                    duration: const Duration(milliseconds: 500),
                    () => VerifyProcessing(),
                  );
                },
                fontSize: 12.0.sp,
                borderRadius: 50,
                fontColor: Colors.white,
                fontWeight: FontWeight.bold,
                backgroundColor: AppStyles.bgPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
