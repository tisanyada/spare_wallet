// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';

class HomeAtmCard extends StatelessWidget {
  final String balance;
  final String walletNumber;
  const HomeAtmCard({
    super.key,
    required this.balance,
    required this.walletNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 22.0.hp,
      padding: EdgeInsets.only(
        left: 6.0.wp,
        right: 4.0.wp,
      ),
      decoration: BoxDecoration(
        color: AppStyles.bgSecondary,
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage('assets/images/bg__atm__1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'spare balance',
                    color: Colors.white.withOpacity(0.8),
                    size: 14.0.sp,
                  ),
                  Row(
                    children: [
                      CustomTextWidget(
                        text: '\$ $balance',
                        color: Colors.white,
                        size: 20.0.sp,
                        weight: FontWeight.bold,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: ImageIcon(
                          AssetImage('assets/icons/icon__eye.png'),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Container(
                    width: 20.0.wp,
                    height: 4.0.hp,
                    padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                            2,
                            (index) {
                              return Container(
                                width: 5,
                                height: 5,
                                margin: EdgeInsets.only(right: 2),
                                decoration: BoxDecoration(
                                  color: AppStyles.bgSecondary,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              );
                            },
                          ),
                        ),
                        CustomTextWidget(
                          text: walletNumber,
                          size: 12.0.sp,
                          weight: FontWeight.bold,
                          color: AppStyles.bgSecondary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
