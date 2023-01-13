// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/data/index.dart';
import 'package:spare_wallet/screens/auth/signin_screen.dart';
import 'package:spare_wallet/services/auth_services.dart';
import 'package:spare_wallet/widgets/buttons/circular_back_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_country_dropdown_button.dart';
import 'package:spare_wallet/widgets/buttons/custom_loading_button.dart';
import 'package:spare_wallet/widgets/snackbars/custom_snackbar_container.dart';
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
  int country = 0;
  String countryName = 'Afghanistan';
  final AuthServices authServices = Get.find();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onCountryChangeHandler(int value) {
    debugPrint('[COUNTRY] :: $value');
    setState(() {
      country = value;
      countryName = countries[value];
    });
  }

  Future<void> signupHandler() async {
    if (!firstNameController.text.trim().isNotEmpty ||
        !lastNameController.text.trim().isNotEmpty ||
        !emailController.text.trim().isNotEmpty ||
        !phoneController.text.trim().isNotEmpty ||
        !passwordController.text.trim().isNotEmpty ||
        !countryName.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackbarContainer(
            backgroundType: '',
            title: 'Info',
            description:
                'Please ensure your fill in all fields in the form as the are required.',
          ),
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      );
    } else {
      Map data = {
        "first_name": firstNameController.text.trim(),
        "last_name": lastNameController.text.trim(),
        "email": emailController.text.trim(),
        "phone": phoneController.text.trim(),
        "country": countryName,
        "password": passwordController.text.trim(),
      };

      debugPrint('[SIGNUP DTO] :: $data');
      await authServices.signupController(
        data,
      );

      debugPrint('[ERROR] :: ${authServices.authRequestError.value}');

      if (authServices.authRequestError.value == 'Invalid email address.') {
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
      if (authServices.authRequestError.value ==
          'User with this Email Address already exists.') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomSnackbarContainer(
              backgroundType: 'ERROR',
              title: 'DUPLICATE',
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

        setState(() {
          firstNameController.clear();
          lastNameController.clear();
          emailController.clear();
          phoneController.clear();
          passwordController.clear();
          country = 0;
          countryName = 'Afghanistan';
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
                  keyboardType: TextInputType.number,
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
                CustomCountryDropdownButton(
                  country: country,
                  onChangeHandler: onCountryChangeHandler,
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
                        text: 'Sign Up',
                        width: double.maxFinite,
                        height: 6.0.hp,
                        onTapHandler: signupHandler,
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
      ),
    );
  }
}
