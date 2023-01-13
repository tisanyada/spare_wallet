// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/screens/auth/verify_success_screen.dart';
import 'package:spare_wallet/screens/public/loading_animation.dart';
import 'package:spare_wallet/services/auth_services.dart';
import 'package:spare_wallet/widgets/buttons/circular_back_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_loading_button.dart';
import 'package:spare_wallet/widgets/snackbars/custom_snackbar_container.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';

class VerifyPhoneScreen extends StatefulWidget {
  final String phone;
  const VerifyPhoneScreen({super.key, required this.phone});

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  String otpCode = '';
  final AuthServices authServices = Get.find();

  void runTimeout() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.to(
      transition: Transition.fade,
      duration: const Duration(milliseconds: 500),
      () => const VerifySuccessScreen(),
    );
  }

  Future<void> onsubmitHandler() async {
    // CALL VERIFY PHONE FUNCTION

    debugPrint("[OTP SUBMIT] :: $otpCode");
    debugPrint("[OTP LEN] :: ${otpCode.length}");

    if (otpCode.isEmpty ||
        otpCode.length == 1 ||
        otpCode.length == 2 ||
        otpCode.length == 3) {
      debugPrint("[OTP ERROR] :: CODE MUST BE OF LENGTH 4");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackbarContainer(
            backgroundType: 'ERROR',
            title: 'Info',
            description: 'Please ensure your OTP code is four digits.',
          ),
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          backgroundColor: Colors.transparent,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 150,
          ),
        ),
      );
    } else {
      Map dto = {
        "token": otpCode,
      };

      await authServices.activateAccountController(dto);

      if (authServices.authRequestError.value.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomSnackbarContainer(
              backgroundType: 'ERROR',
              title: 'Oh snap!',
              description: authServices.authRequestError.value,
            ),
            behavior: SnackBarBehavior.floating,
            elevation: 0,
            backgroundColor: Colors.transparent,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 150,
            ),
          ),
        );
      }

      if (authServices.authRequestStatus.value == 'SUCCESS') {
        setState(() {
          otpCode = '';
          authServices.authLoading.value = false;
          authServices.authRequestError.value = '';
          authServices.authRequestStatus.value = '';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomSnackbarContainer(
              backgroundType: 'SUCCESS',
              title: 'Success',
              description:
                  'Registration successful, please refer to your phone number for your account verification OTP.',
            ),
            behavior: SnackBarBehavior.floating,
            elevation: 0,
            backgroundColor: Colors.transparent,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 150,
            ),
          ),
        );

        Get.to(
          transition: Transition.zoom,
          duration: const Duration(milliseconds: 500),
          () => LoadingAnimation(timeoutFunction: runTimeout),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
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
                            text: '+234-${widget.phone}',
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
                          debugPrint('[OTP CHANGE] :: $value');
                          if (value.length == 1) {
                            setState(() {
                              otpCode = "$otpCode$value";
                            });

                            FocusScope.of(context).nextFocus();
                          } else {
                            setState(() {
                              otpCode = '';
                            });
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
                          debugPrint('[OTP CHANGE] :: $value');

                          if (value.length == 1) {
                            setState(() {
                              otpCode = "$otpCode$value";
                            });

                            FocusScope.of(context).nextFocus();
                          } else {
                            setState(() {
                              otpCode = otpCode.substring(0, 1);
                            });

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
                          debugPrint('[OTP CHANGE] :: $value');
                          if (value.length == 1) {
                            setState(() {
                              otpCode = "$otpCode$value";
                            });

                            FocusScope.of(context).nextFocus();
                          } else {
                            setState(() {
                              otpCode = otpCode.substring(0, 2);
                            });

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
                          debugPrint('[OTP CHANGE] :: $value');

                          if (value.length == 1) {
                            setState(() {
                              otpCode = "$otpCode$value";
                            });
                            onsubmitHandler();
                          } else {
                            setState(() {
                              otpCode = otpCode.substring(0, 3);
                            });

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
                authServices.authRequestStatus.value == "PENDING"
                    ? CustomLoadingButton(
                        width: double.maxFinite,
                        height: 6.0.hp,
                        borderRadius: 50,
                        backgroundColor: AppStyles.bgPrimary,
                      )
                    : CustomButton(
                        text: 'Verify',
                        width: double.maxFinite,
                        height: 6.0.hp,
                        onTapHandler: onsubmitHandler,
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
      ),
    );
  }
}
