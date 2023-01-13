import 'package:get/get.dart';
import 'package:spare_wallet/models/home_screen_model.dart';
import 'package:spare_wallet/models/user_model.dart';
import 'package:spare_wallet/models/wallet_screen_model.dart';

class UserRepository extends GetxController {
  var userData = UserModel.fromJson({}).obs;

  var homeData = HomeScreenModel.fromJson({}).obs;
  var walletData = WalletScreenModel.fromJson({}).obs;
}
