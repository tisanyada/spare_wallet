// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/data/index.dart';

class CustomCountryDropdownButton extends StatefulWidget {
  final int country;
  final Function onChangeHandler;
  const CustomCountryDropdownButton({
    super.key,
    required this.country,
    required this.onChangeHandler,
  });

  @override
  State<CustomCountryDropdownButton> createState() =>
      _CustomCountryDropdownButtonState();
}

class _CustomCountryDropdownButtonState
    extends State<CustomCountryDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(
        left: 4.0.wp,
        right: 4.0.wp,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppStyles.bgGrayShade1),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 1.8.hp,
            child: Image.asset('assets/icons/icon__globe.png'),
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
              left: 6.0.wp,
            ),
            child: DropdownButton(
              underline: SizedBox(),
              style: TextStyle(
                color: AppStyles.bgGray,
                fontSize: 12.0.sp,
              ),
              isExpanded: true,
              value: countries[widget.country],
              icon: Icon(Icons.keyboard_arrow_down),
              items: countries.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                // swidget.handleChange!(int.parse(value.toString()));
                debugPrint('[COUNTRY BTN]:: ${value.runtimeType}');
                int index = countries.indexWhere((element) => element == value);
                widget.onChangeHandler(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
