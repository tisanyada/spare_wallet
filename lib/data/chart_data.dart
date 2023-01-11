// ignore_for_file: prefer_const_constructors
import 'package:spare_wallet/config/app_config.dart';
import 'package:spare_wallet/models/home_chart_data_model.dart';

class HomeBarData {
  static int interval = 5;

  static List<HomeChartDataModel> barData = [
    HomeChartDataModel(
      id: 0,
      y: 12,
      color: AppStyles.bgSecondary,
    ),
    HomeChartDataModel(
      id: 1,
      y: 10,
      color: AppStyles.bgSecondary,
    ),
    HomeChartDataModel(
      id: 2,
      y: 15,
      color: AppStyles.bgGreenLight,
    ),
    HomeChartDataModel(
      id: 3,
      y: 17,
      color: AppStyles.bgSecondary,
    ),
    HomeChartDataModel(
      id: 4,
      y: 8,
      color: AppStyles.bgSecondary,
    ),
    HomeChartDataModel(
      id: 5,
      y: 14,
      color: AppStyles.bgSecondary,
    ),
    HomeChartDataModel(
      id: 6,
      y: 5,
      color: AppStyles.bgSecondary,
    ),
  ];
}
