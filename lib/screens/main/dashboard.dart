// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spare_wallet/archive/user_repository.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/models/user_model.dart';
import 'package:spare_wallet/screens/auth/signin_screen.dart';
import 'package:spare_wallet/screens/main/home_screen.dart';
import 'package:spare_wallet/screens/main/messages_screen.dart';
import 'package:spare_wallet/screens/main/profile_screen.dart';
import 'package:spare_wallet/screens/main/send_popup_screen.dart';
import 'package:spare_wallet/screens/main/wallet_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentPage = 0;
  final authStorage = GetStorage();
  final UserRepository userRepository = Get.find();

  void initializeUser() async {
    if (userRepository.userData.value.avatar == null) {
      userRepository.userData.value =
          UserModel.fromJson(await authStorage.read('USER'));
    }

    if (userRepository.userData.value.isVerified == false) {
      Get.to(
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(milliseconds: 5000),
        () => SigninScreen(),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    initializeUser();
  }

  List screens = [
    HomeScreen(),
    WalletScreen(),
    MessagesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPage],
      floatingActionButton: Container(
        margin: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
          backgroundColor: AppStyles.bgSecondary,
          onPressed: () {
            // Add your onPressed code here!
            print('SEND BUTTON');

            showModalBottomSheet(
              context: context,
              useRootNavigator: true,
              backgroundColor: Colors.white.withOpacity(0),
              builder: (BuildContext context) {
                return SendPopupScreen(modalContext: context);
              },
            );
          },
          child: ImageIcon(
            AssetImage('assets/icons/icon__send.png'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          setState(() {
            currentPage = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPage,
        selectedItemColor: AppStyles.bgPrimary,
        unselectedItemColor: AppStyles.bgSecondary,
        elevation: 10.0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon__home.png'),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon__wallet.png'),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon__message.png'),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon__profile.png'),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
