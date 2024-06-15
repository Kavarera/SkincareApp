import 'package:get/get.dart';

import '../controllers/beranda_admin_controller.dart';

class BerandaAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BerandaAdminController>(
      () => BerandaAdminController(),
    );
  }
}
