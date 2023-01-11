import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarTitles {
  static SideTitles get getTopBottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = 'Apr 30';
              break;
            case 1:
              text = 'May 01';
              break;
            case 2:
              text = 'May 02';
              break;
            case 3:
              text = 'May 03';
              break;
            case 4:
              text = 'May 04';
              break;
            case 5:
              text = 'May 05';
              break;
            case 6:
              text = 'May 06';
              break;
          }

          return Text(text);
        },
      );
}
