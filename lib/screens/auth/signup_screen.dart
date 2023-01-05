// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/screens/auth/signin_screen.dart';
import 'package:spare_wallet/screens/auth/verify_phone_screen.dart';
import 'package:spare_wallet/widgets/buttons/circular_back_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_border_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_country_dropdown_button.dart';
import 'package:spare_wallet/widgets/text/custom_formpassword_field.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';
import 'package:spare_wallet/widgets/text/cutom_formtext_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool showPassword = true;
  final authStorage = GetStorage();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    authStorage.write('current_screen', 'AUTH');
  }

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
                child: Column(
                  children: [
                    Image.asset('assets/images/logo__1.png'),
                    CustomTextWidget(
                      text: 'Create an account',
                      size: 18.0.sp,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0.hp),
              CustomFormTextField(
                hintText: 'First name',
                controller: firstNameController,
                prefixIcon: ImageIcon(
                  AssetImage('assets/icons/icon__user.png'),
                ),
              ),
              SizedBox(height: 2.0.hp),
              CustomFormTextField(
                hintText: 'Last name',
                controller: lastNameController,
                prefixIcon: ImageIcon(
                  AssetImage('assets/icons/icon__user.png'),
                ),
              ),
              SizedBox(height: 2.0.hp),
              CustomFormTextField(
                hintText: 'Email',
                controller: emailController,
                prefixIcon: ImageIcon(
                  AssetImage('assets/icons/icon__email.png'),
                ),
              ),
              SizedBox(height: 2.0.hp),
              CustomFormTextField(
                hintText: 'Phone',
                controller: phoneController,
                prefixIcon: ImageIcon(
                  AssetImage('assets/icons/icon__phone.png'),
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
              SizedBox(height: 2.0.hp),
              CustomCountryDropdownButton(),
              SizedBox(height: 5.0.hp),
              CustomButton(
                text: 'Sign Up',
                width: double.maxFinite,
                height: 6.0.hp,
                onTapHandler: () {
                  // CALL SIGNUP FUNCTION
                  Get.to(
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 500),
                    () => VerifyPhoneScreen(),
                  );
                },
                fontSize: 12.0.sp,
                borderRadius: 50,
                fontColor: Colors.white,
                fontWeight: FontWeight.bold,
                backgroundColor: AppStyles.bgPrimary,
              ),
              SizedBox(height: 2.0.hp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget(
                    text: 'Already have an account?  ',
                    size: 14.0.sp,
                    color: AppStyles.bgGray,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        transition: Transition.leftToRight,
                        duration: const Duration(milliseconds: 500),
                        () => SigninScreen(),
                      );
                    },
                    child: CustomTextWidget(
                      text: 'Sign in',
                      size: 14.0.sp,
                      color: AppStyles.bgSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
