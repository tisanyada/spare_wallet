// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/data/index.dart';
import 'package:spare_wallet/screens/auth/signin_screen.dart';
import 'package:spare_wallet/widgets/buttons/custom_button.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          // color: Colors.amber,
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: onboardingData.length,
            itemBuilder: (_, index) {
              return Center(
                child: Container(
                  width: double.maxFinite,
                  height: screenHeight * 0.70,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getWidth(38),
                  ),
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            onboardingData[index]['image'],
                          ),
                          SizedBox(height: 5.0.hp),
                          CustomTextWidget(
                            text: onboardingData[index]['title'],
                            size: 20.0.sp,
                            weight: FontWeight.w500,
                          ),
                          Container(
                            width: 50.0.wp,
                            child: CustomTextWidget(
                              text: onboardingData[index]['description'],
                              alignment: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 2.0.hp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              3,
                              (dotIndex) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: AppLayout.getHeight(10),
                                  ),
                                  width: index == dotIndex ? 20 : 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: index == dotIndex
                                        ? AppStyles.bgPrimary
                                        : AppStyles.bgGrayLight,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      CustomButton(
                        text: 'Get Started',
                        width: double.maxFinite,
                        height: 6.0.hp,
                        onTapHandler: () {
                          Get.to(
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 500),
                            () => SigninScreen(),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
