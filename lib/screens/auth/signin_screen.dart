// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/screens/auth/signup_screen.dart';
import 'package:spare_wallet/widgets/buttons/circular_back_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_border_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_button.dart';
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
  final authStorage = GetStorage();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    authStorage.write('current_screen', 'AUTH');
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white.withOpacity(0),
      //   shadowColor: Colors.white.withOpacity(0),
      //   leading: IconButton(
      //     style: ButtonStyle(
      //       backgroundColor: MaterialStateProperty.resolveWith<Color>(
      //         (Set<MaterialState> states) {
      //           if (states.contains(MaterialState.pressed)) {
      //             return Colors.red;
      //           }
      //           if (states.contains(MaterialState.disabled)) {
      //             return Colors.grey;
      //           }
      //           return Colors.blue;
      //         },
      //       ),
      //     ),
      //     onPressed: () {},
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularBackButton(),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: AppStyles.bgPrimary.withOpacity(0.1),
                    child: Image.asset('assets/images/user__avatar__1.jpg'),
                  ),
                ],
              ),
              SizedBox(height: 1.0.hp),
              CustomTextWidget(
                text: 'Welcome back,',
                size: 18.0.sp,
              ),
              CustomTextWidget(
                text: 'Ugo',
                size: 18.0.sp,
                weight: FontWeight.bold,
              ),
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
              CustomButton(
                text: 'Sign In',
                width: double.maxFinite,
                height: 6.0.hp,
                onTapHandler: () {
                  // CALL LOGIN FUNCTION
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
    );
  }
}
