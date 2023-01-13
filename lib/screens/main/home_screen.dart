// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:spare_wallet/archive/user_repository.dart';
import 'package:spare_wallet/config/api_config.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/data/index.dart';
import 'package:spare_wallet/screens/main/pages/add_money_screen.dart';
import 'package:spare_wallet/services/user_services.dart';
import 'package:spare_wallet/widgets/cards/home_atm_card.dart';
import 'package:spare_wallet/widgets/cards/transaction_card.dart';
import 'package:spare_wallet/widgets/charts/home_bar_chart.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentButton = 'Trending'.obs;
  String walletNumber = "";
  final UserRepository userRepository = Get.find();
  final UserServices userServices = Get.find();

  @override
  void initState() {
    super.initState();

    userServices.fetchHomeDataController();
  }

  @override
  Widget build(BuildContext context) {
    if (userRepository.homeData.value.wallet?.walletNumber != null) {
      setState(() {
        walletNumber = userRepository.homeData.value.wallet!.walletNumber!
            .substring(
                userRepository.homeData.value.wallet!.walletNumber!.length - 4);
      });
    }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: AppStyles.bgPrimary.withOpacity(0.1),
                          backgroundImage:
                              // Image.asset('assets/images/user__avatar__1.jpg'),
                              NetworkImage(
                            '${APIConstants.backendServerRootUrl}${userRepository.userData.value.avatar}',
                          ),
                        ),
                        SizedBox(width: 2.0.wp),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              text: 'Good day, ',
                              size: 12.0.sp,
                            ),
                            CustomTextWidget(
                              text:
                                  '${userRepository.userData.value.firstName}',
                              size: 12.0.sp,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.bell,
                            size: 30,
                            color: AppStyles.bgSecondary.withOpacity(0.6),
                          ),
                        ),
                        Positioned(
                          top: 2,
                          right: 5,
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: AppStyles.bgRed,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: CustomTextWidget(
                                text: '0',
                                color: Colors.white,
                                size: 8.0.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 1.0.hp),
                // ATM CARD 1
                HomeAtmCard(
                  balance:
                      "${userRepository.homeData.value.wallet?.walletBalance}",
                  walletNumber: walletNumber,
                ),
                SizedBox(height: 2.0.hp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Get.to(
                            transition: Transition.fade,
                            duration: const Duration(milliseconds: 500),
                            () => const AddMoneyScreen(),
                          );
                        }
                      },
                      child: Container(
                        width: 25.0.wp,
                        height: 5.0.hp,
                        padding: EdgeInsets.symmetric(horizontal: 1.0.wp),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 2,
                            color: AppStyles.bgSecondary,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              index == 0
                                  ? Icons.add
                                  : index == 1
                                      ? Icons.arrow_downward
                                      : Icons.menu,
                              size: 20,
                              color: AppStyles.bgSecondary,
                            ),
                            SizedBox(width: 1.0.wp),
                            CustomTextWidget(
                              text: index == 0
                                  ? 'Add money'
                                  : index == 1
                                      ? 'Withdraw'
                                      : 'More...',
                              size: 10.0.sp,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 2.0.hp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'My Analysis',
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
                SizedBox(height: 2.0.hp),
                HomeBarChart(),
                SizedBox(height: 2.0.hp),
                CustomTextWidget(
                  text: 'May, 2022',
                  weight: FontWeight.w500,
                ),
                Column(
                  children: List.generate(2, (index) {
                    return TransactionCard(
                        data: homeTransactions, index: index);
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
