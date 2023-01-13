// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/archive/user_repository.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/data/index.dart';
import 'package:spare_wallet/services/user_services.dart';
import 'package:spare_wallet/widgets/cards/transaction_card.dart';
import 'package:spare_wallet/widgets/cards/wallet_atm_card.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';
import 'package:spare_wallet/widgets/utils/custom_text_header.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  var currentButton = 'Trending'.obs;
  final UserServices userServices = Get.find();
  final UserRepository userRepository = Get.find();

  @override
  void initState() {
    super.initState();

    userServices.fetchWalletDataController();
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
              CustomTextHeader(title: 'My Wallet'),
              SizedBox(height: 2.0.hp),
              WalletAtmCard(),
              SizedBox(height: 2.0.hp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: 'Transactions',
                    weight: FontWeight.w500,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppStyles.bgSecondary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: [
                        CustomTextWidget(
                          text: 'Week',
                          size: 12.0.sp,
                          color: AppStyles.bgSecondary,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppStyles.bgSecondary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: List.generate(walletTransactions.length, (index) {
                  return TransactionCard(
                      data: walletTransactions, index: index);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
