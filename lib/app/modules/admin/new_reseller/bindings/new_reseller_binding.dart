import 'package:get/get.dart';

import '../controllers/new_reseller_controller.dart';

class NewResellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewResellerController>(
      () => NewResellerController(),
    );
  }
}
