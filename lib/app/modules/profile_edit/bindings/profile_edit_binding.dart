import 'package:get/get.dart';

import '../controllers/profile_edit_controller.dart';

class ProfileEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEditController>(
      () => ProfileEditController(),
    );
  }
}
