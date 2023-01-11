// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';
import 'package:spare_wallet/widgets/utils/custom_text_header.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
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
              CustomTextHeader(title: 'Messages'),
              SizedBox(height: 4.0.hp),
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/message.png'),
              ),
              SizedBox(height: 10.0.hp),
              Center(
                child: Column(
                  children: [
                    CustomTextWidget(
                      text: 'No new messages!',
                      size: 18.0.sp,
                      color: AppStyles.bgBlack,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(height: 2.0.hp),
                    Container(
                      width: 50.0.wp,
                      child: CustomTextWidget(
                        text:
                            'Your inbox is empty. Start sending messages to your fellow spare friends.',
                        size: 14.0.sp,
                        alignment: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10.0.hp),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 70.0.wp,
                        height: 5.0.hp,
                        padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                        decoration: BoxDecoration(
                          color: AppStyles.bgPrimary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: AppStyles.bgGreenLight,
                            ),
                            SizedBox(width: 2.0.wp),
                            CustomTextWidget(
                              text: 'New Message',
                              color: Colors.white,
                              // size: fontSize,
                              // weight: fontWeight,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
