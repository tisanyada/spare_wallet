// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/data/chart_data.dart';
import 'package:spare_wallet/widgets/charts/bar_titles.dart';

class HomeBarChart extends StatelessWidget {
  final double barWidth = 10;
  const HomeBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0.hp,
      padding: EdgeInsets.symmetric(
        vertical: 2.0.hp,
        horizontal: 5.0.wp,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(0),
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(0, 5),
            blurRadius: 2,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(2, 0),
            blurRadius: 2,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-2, 0),
            blurRadius: 2,
          ),
        ],
      ),
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(show: false),
          alignment: BarChartAlignment.spaceEvenly,
          maxY: 20,
          minY: 0,
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: BarTitles.getTopBottomTitles),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          barGroups: HomeBarData.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.id,
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      width: barWidth,
                      color: data.color,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
