import 'package:flutter/material.dart';

class HomeChartDataModel {
  // for ordering in the graph
  final int id;
  // final String name;
  final double y;
  final Color color;

  const HomeChartDataModel({
    // required this.name,
    required this.id,
    required this.y,
    required this.color,
  });
}