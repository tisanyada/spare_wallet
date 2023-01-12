import 'package:get/get.dart';
import 'package:spare_wallet/models/user_model.dart';

class UserRepository extends GetxController {
  var userData = UserModel.fromJson({}).obs;
}
