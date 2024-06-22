import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_skincare/app/data/models/user_model.dart';
import 'package:toko_skincare/app/modules/home/controllers/home_controller.dart';
import 'package:toko_skincare/app/modules/product/controllers/product_controller.dart';
import 'package:toko_skincare/core/services/transaction_service.dart';

class DetailProductController extends GetxController {
  var isLoading = false.obs;
  TransactionService _service = TransactionService();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void createTransaction() async {
    isLoading.value = true;
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? dataUser = pref.getString('user');
      if (dataUser == null) {
        Get.snackbar('Error', 'No user detected!');
        return;
      }
      User user = User.fromJson(json.decode(dataUser));
      HomeController hc = Get.find();
      await _service.createTransaction(
          user.access_token!, user.id, hc.selectedProduct.value!.id);
      Get.snackbar('Success', 'Product telah dibeli, periksa status di history',
          duration: const Duration(seconds: 2));
    } catch (e) {
      Get.snackbar('Failed to buy', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
