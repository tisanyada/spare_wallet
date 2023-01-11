// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/data/index.dart';
import 'package:spare_wallet/screens/auth/signin_screen.dart';
import 'package:spare_wallet/widgets/buttons/custom_profile_icon_button.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';
import 'package:spare_wallet/widgets/utils/custom_text_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var currentButton = 'Trending'.obs;

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
              CustomTextHeader(title: 'Profile'),
              SizedBox(height: 4.0.hp),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/user__avatar__1.jpg',
                      width: 15.0.wp,
                    ),
                    CustomTextWidget(
                      text: 'King Ugochukwu',
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
                          text: '**4552',
                          size: 6.0.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: List.generate(profileTabs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      if (profileTabs[index]['action'] == 'auth') {
                        Get.to(
                          transition: Transition.zoom,
                          duration: const Duration(milliseconds: 500),
                          () => SigninScreen(),
                        );
                      }
                    },
                    child: CustomProfileIconButton(data: profileTabs[index]),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
