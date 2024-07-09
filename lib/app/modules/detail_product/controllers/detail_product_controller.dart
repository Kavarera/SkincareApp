import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_skincare/app/data/models/user_model.dart';
import 'package:toko_skincare/app/modules/home/controllers/home_controller.dart';
import 'package:toko_skincare/app/modules/product/controllers/product_controller.dart';
import 'package:toko_skincare/app/routes/app_pages.dart';
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
      String qrContent = await _service.createTransaction(
          user.access_token!, user.id, hc.selectedProduct.value!.id);
      if (!qrContent.isEmpty) {
        qrContent = qrContent.split(',')[1];
        Get.toNamed(Routes.PEMBAYARAN, arguments: qrContent);
      }
    } catch (e) {
      Get.snackbar('Gagal untuk membeli', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
