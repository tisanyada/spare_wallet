// ignore_for_file: must_be_immutable

import 'package:flutter/widgets.dart';
import 'package:spare_wallet/config/app_config.dart';

class CustomSnackbarTextWidget extends StatelessWidget {
  final String text;
  Color? color;
  double? size;
  FontWeight? weight;
  TextAlign? alignment;

  CustomSnackbarTextWidget({
    super.key,
    this.color,
    this.size,
    this.weight,
    this.alignment,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.left,
      style: TextStyle(
        color: color,
        fontSize: size ?? 16.0.sp,
        fontWeight: weight ?? FontWeight.normal,
      ),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}
