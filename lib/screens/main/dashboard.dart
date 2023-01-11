// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';
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
