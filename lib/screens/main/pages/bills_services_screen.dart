// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/data/index.dart';
import 'package:spare_wallet/widgets/buttons/custom_icon_button.dart';
import 'package:spare_wallet/widgets/utils/custom_search_bar.dart';
import 'package:spare_wallet/widgets/utils/custom_text_header.dart';

class BillsAndServicesScreen extends StatefulWidget {
  const BillsAndServicesScreen({super.key});

  @override
  State<BillsAndServicesScreen> createState() => _BillsAndServicesScreenState();
}

class _BillsAndServicesScreenState extends State<BillsAndServicesScreen> {
  TextEditingController searchController = TextEditingController();

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
              CustomTextHeader(title: 'Bills & Services'),
              SizedBox(height: 4.0.hp),
              CustomSearchBar(
                hintText: 'Search bills & services',
                controller: searchController,
              ),
              SizedBox(height: 4.0.hp),
              Column(
                children: List.generate(services.length, (index) {
                  return CustomIconButton(data: services[index]);
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
