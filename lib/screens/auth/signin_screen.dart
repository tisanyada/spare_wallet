// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/archive/user_repository.dart';
import 'package:spare_wallet/config/api_config.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/screens/auth/signup_screen.dart';
import 'package:spare_wallet/screens/main/dashboard.dart';
import 'package:spare_wallet/services/auth_services.dart';
import 'package:spare_wallet/widgets/buttons/circular_back_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_border_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_loading_button.dart';
import 'package:spare_wallet/widgets/snackbars/custom_snackbar_container.dart';
import 'package:spare_wallet/widgets/text/custom_formpassword_field.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';
import 'package:spare_wallet/widgets/text/cutom_formtext_field.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool showPassword = true;
  bool rememberMe = false;
  final AuthServices authServices = Get.find();
  final UserRepository userRepository = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signinHandler() async {
    if (!emailController.text.trim().isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackbarContainer(
            backgroundType: 'ERROR',
            title: 'Oh Snap!',
            description: 'Email field is required',
          ),
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      );
    } else if (!passwordController.text.trim().isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackbarContainer(
            backgroundType: 'ERROR',
            title: 'Oh Snap!',
            description: 'Password field is required',
          ),
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      );
    } else {
      Map data = {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };

      await authServices.signinController(
        data,
      );

      // debugPrint('{ERROR} :: ${authServices.authRequestError.value}');

      if (authServices.authRequestError.value == 'Incorrect password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomSnackbarContainer(
              backgroundType: 'ERROR',
              title: 'Validation Error',
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
      if (authServices.authRequestError.value == 'Email is not registered!') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomSnackbarContainer(
              backgroundType: 'ERROR',
              title: 'Validation Error',
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

      if (authServices.authRequestError.value == 'ACCOUNT UNVERIFIED') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomSnackbarContainer(
              backgroundType: '',
              title: 'Account Unverified',
              description:
                  'Please check your mail for an activation token to activate your account.',
            ),
            behavior: SnackBarBehavior.floating,
            elevation: 0,
            duration: Duration(milliseconds: 5000),
            backgroundColor: Colors.transparent,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 150,
            ),
          ),
        );
      }

      if (authServices.authRequestStatus.value == 'SUCCESS') {
        setState(() {
          emailController.clear();
          passwordController.clear();
        });
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircularBackButton(),
                    userRepository.userData.value.avatar != null
                        ? CircleAvatar(
                            radius: 22,
                            backgroundColor:
                                AppStyles.bgPrimary.withOpacity(0.1),
                            backgroundImage: NetworkImage(
                                "${APIConstants.backendServerRootUrl}${userRepository.userData.value.avatar}"),
                          )
                        : Container(),
                  ],
                ),
                SizedBox(height: 1.0.hp),
                CustomTextWidget(
                  text: 'Welcome back,',
                  size: 18.0.sp,
                ),
                userRepository.userData.value.firstName != null
                    ? CustomTextWidget(
                        text: "${userRepository.userData.value.firstName}",
                        size: 18.0.sp,
                        weight: FontWeight.bold,
                      )
                    : Container(),
                CustomTextWidget(
                  text: 'Hope you are doing great?',
                  size: 12.0.sp,
                  color: AppStyles.bgGray,
                ),
                SizedBox(height: 5.0.hp),
                CustomFormTextField(
                  hintText: 'Email',
                  controller: emailController,
                  prefixIcon: ImageIcon(
                    AssetImage('assets/icons/icon__user.png'),
                  ),
                ),
                SizedBox(height: 2.0.hp),
                CustomFormPasswordField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  prefixIcon: ImageIcon(
                    AssetImage('assets/icons/icon__lock.png'),
                  ),
                  suffixIcon: ImageIcon(
                    AssetImage('assets/icons/icon__eye.png'),
                  ),
                  showPassword: showPassword,
                ),
                SizedBox(height: 1.0.hp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = !rememberMe;
                            });
                          },
                        ),
                        CustomTextWidget(
                          text: 'Remember me',
                          size: 12.0.sp,
                          color: AppStyles.bgGray,
                        ),
                      ],
                    ),
                    CustomTextWidget(
                      text: 'Forgot password?',
                      size: 12.0.sp,
                      color: AppStyles.bgPrimary.withOpacity(0.8),
                    ),
                  ],
                ),
                SizedBox(height: 5.0.hp),
                authServices.authRequestStatus.value == 'PENDING'
                    ? CustomLoadingButton(
                        width: double.maxFinite,
                        height: 6.0.hp,
                        borderRadius: 50,
                        backgroundColor: AppStyles.bgPrimary,
                      )
                    : CustomButton(
                        text: 'Sign In',
                        width: double.maxFinite,
                        height: 6.0.hp,
                        onTapHandler: () {
                          signinHandler();
                        },
                        fontSize: 12.0.sp,
                        borderRadius: 50,
                        fontColor: Colors.white,
                        fontWeight: FontWeight.bold,
                        backgroundColor: AppStyles.bgPrimary,
                      ),
                SizedBox(height: 3.0.hp),
                CustomBorderButton(
                  text: 'Sign Up',
                  width: double.maxFinite,
                  height: 6.0.hp,
                  onTapHandler: () {
                    Get.to(
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 500),
                      () => SignupScreen(),
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
        ),
      ),
    );
  }
}
