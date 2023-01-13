// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/archive/user_repository.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/data/index.dart';
import 'package:spare_wallet/services/user_services.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';

class WalletAtmCard extends StatefulWidget {
  const WalletAtmCard({super.key});

  @override
  State<WalletAtmCard> createState() => _WalletAtmCardState();
}

class _WalletAtmCardState extends State<WalletAtmCard> {
  String expYear = '';
  String expMonth = '';
  String cardNumber = '**** **** **** ';
  final UserServices userServices = Get.find();
  final UserRepository userRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    String getCardNumber(int index) {
      cardNumber =
          "**** **** **** ${userRepository.walletData.value.debitcards?[index].cardNumber?.substring(11, 16)}";

      return cardNumber;
    }

    String getExpirationDate(int index) {
      expYear =
          "${userRepository.walletData.value.debitcards?[index].cardExpiration?.substring(2, 4)}";
      expMonth =
          "${userRepository.walletData.value.debitcards?[index].cardExpiration?.substring(5, 7)}";

      return "$expMonth/$expYear";
    }

    return Obx(
      () => Container(
        height: 25.0.hp,
        width: double.maxFinite,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          // itemCount: walletAtmCards.length,
          itemCount: userRepository.walletData.value.debitcards?.length,
          itemBuilder: (_, index) {
            return Stack(
              children: [
                Container(
                  height: 22.0.hp,
                  width: 100.0.wp,
                  padding: EdgeInsets.only(
                    left: 6.0.wp,
                    right: 4.0.wp,
                  ),
                  decoration: BoxDecoration(
                    color: index == 0
                        ? AppStyles.bgPrimary
                        : index == 1
                            ? AppStyles.bgSecondary
                            : AppStyles.bgBlack,
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg__atm__2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  userRepository.walletData.value
                                              .debitcards?[index].cardType ==
                                          'VISA'
                                      ? Image.asset(
                                          'assets/icons/icon__visa.png')
                                      : Image.asset(
                                          'assets/icons/icon__paypass.png'),
                                  Image.asset('assets/icons/icon__paypass.png'),
                                ],
                              ),
                              SizedBox(height: 2.0.hp),
                              Image.asset('assets/icons/icon__chip.png'),
                              SizedBox(height: 2.0.hp),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(
                                    text: getCardNumber(index),
                                    color: Colors.white,
                                    size: 14.0.sp,
                                    // size: 20.0.sp,
                                    weight: FontWeight.w500,
                                  ),
                                  CustomTextWidget(
                                    text: getExpirationDate(index),
                                    color: Colors.white,
                                    size: 14.0.sp,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 1.0.hp),
                          CustomTextWidget(
                            text: userRepository.walletData.value
                                    .debitcards?[index].cardName ??
                                "${userRepository.walletData.value.debitcards?[index].cardName}",
                            color: Colors.white,
                            size: 14.0.sp,
                            // size: 20.0.sp,
                            weight: FontWeight.w500,
                            alignment: TextAlign.start,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        userRepository.walletData.value.debitcards != null
                            ? userRepository.walletData.value.debitcards!.length
                            : 0, (dotIndex) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: AppLayout.getHeight(10),
                        ),
                        width: index == dotIndex ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == dotIndex
                              ? walletAtmCards[dotIndex]['color']
                              : AppStyles.bgGrayLight,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
