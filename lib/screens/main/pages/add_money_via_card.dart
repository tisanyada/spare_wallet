// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/screens/main/pages/add_money_success_screen.dart';
import 'package:spare_wallet/widgets/buttons/custom_button.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';
import 'package:spare_wallet/widgets/utils/custom_text_header.dart';
import 'package:spare_wallet/widgets/utils/wallet_balance.dart';

class AddMoneyViaCard extends StatefulWidget {
  const AddMoneyViaCard({super.key});

  @override
  State<AddMoneyViaCard> createState() => _AddMoneyViaCardState();
}

class _AddMoneyViaCardState extends State<AddMoneyViaCard> {
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          margin: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(24),
          ),
          // color: Colors.amber,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4.0.hp),
                  CustomTextHeader(title: 'Add money with card'),
                  SizedBox(height: 4.0.hp),
                  Container(
                    width: 50.0.wp,
                    child: CustomTextWidget(
                      text: 'How much would you like to add from your card?',
                      size: 14.0.sp,
                      weight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.0.hp),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppStyles.bgGrayLight),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/icons/icon__visa__2.png'),
                        CustomTextWidget(
                          text: 'xxxx-xxxx-xxxx-0251',
                          size: 14.0.sp,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.0.hp),
                  Center(
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: AppStyles.bgSecondary.withOpacity(0.2),
                      child: Icon(
                        Icons.arrow_downward,
                        size: 12,
                        color: AppStyles.bgSecondary,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.0.hp),
                  WalletBalance(),
                  SizedBox(height: 2.0.hp),
                  Center(
                    child: SizedBox(
                      width: 40.0.wp,
                      height: 6.0.hp,
                      // color: Colors.red,
                      child: TextFormField(
                        controller: amountController,
                        textAlignVertical: TextAlignVertical.center,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(5),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '\$0.00',
                          contentPadding: EdgeInsets.all(10),
                          hintStyle: TextStyle(
                            color: AppStyles.bgGray,
                            fontSize: 30.0.sp,
                          ),
                        ),
                        style: TextStyle(
                          color: AppStyles.bgBlack,
                          fontSize: 30.0.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 4.0.hp),
                  child: CustomButton(
                    text: 'Add money',
                    width: double.maxFinite,
                    height: 6.0.hp,
                    onTapHandler: () {
                      // CALL ONTAP FUNCTION
                      Get.to(
                        transition: Transition.zoom,
                        duration: const Duration(milliseconds: 500),
                        () => AddMoneySuccessScreen(),
                      );
                    },
                    fontSize: 12.0.sp,
                    borderRadius: 50,
                    fontColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    backgroundColor: AppStyles.bgSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
