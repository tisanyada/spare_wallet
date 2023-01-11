// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/data/index.dart';
import 'package:spare_wallet/screens/main/pages/add_money_via_card.dart';
import 'package:spare_wallet/widgets/buttons/custom_icon_button.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';
import 'package:spare_wallet/widgets/utils/custom_text_header.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({super.key});

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
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
              CustomTextHeader(title: 'Add Money'),
              SizedBox(height: 4.0.hp),
              Container(
                width: 50.0.wp,
                child: CustomTextWidget(
                  text: 'How would you like to add money?',
                  size: 14.0.sp,
                  weight: FontWeight.bold,
                ),
              ),
              Column(
                children: List.generate(addMoneyMethods.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      if (addMoneyMethods[index]['page'] == 'card') {
                        Get.to(
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 500),
                          () => AddMoneyViaCard(),
                        );
                      }
                    },
                    child: CustomIconButton(data: addMoneyMethods[index]),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
