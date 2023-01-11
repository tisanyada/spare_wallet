// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/data/index.dart';
import 'package:spare_wallet/widgets/buttons/circular_back_button.dart';
import 'package:spare_wallet/widgets/cards/recipient_card.dart';
import 'package:spare_wallet/widgets/text/custom_text_widget.dart';
import 'package:spare_wallet/widgets/utils/custom_search_bar.dart';
import 'package:spare_wallet/widgets/utils/custom_text_header.dart';

class SendToSpareUserScreen extends StatefulWidget {
  const SendToSpareUserScreen({super.key});

  @override
  State<SendToSpareUserScreen> createState() => _SendToSpareUserScreenState();
}

class _SendToSpareUserScreenState extends State<SendToSpareUserScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 8.0.hp,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
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
                        text: 'New Recipient',
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
      ),
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
              CustomTextHeader(title: 'Send'),
              SizedBox(height: 2.0.hp),
              CustomTextWidget(
                text: 'Recent Recipients',
                size: 14.0.sp,
                weight: FontWeight.w600,
              ),
              SizedBox(height: 2.0.hp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(recentRecipients.length, (index) {
                    return Image.asset(recentRecipients[index]);
                  }),
                ),
              ),
              SizedBox(height: 2.0.hp),
              CustomSearchBar(
                hintText: 'Search by name',
                controller: searchController,
              ),
              Column(
                children: List.generate(recipients.length, (index) {
                  return RecipientCard(index: index);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
