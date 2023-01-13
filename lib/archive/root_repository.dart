// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:spare_wallet/archive/user_repository.dart';
import 'package:spare_wallet/services/auth_services.dart';
import 'package:spare_wallet/services/user_services.dart';

class RootArchive extends GetxController {
  initializeArchives() {
    UserRepository userRepository = Get.put(UserRepository());
    AuthServices authServices  = Get.put(AuthServices());
    UserServices userServices  = Get.put(UserServices());
  }
}
