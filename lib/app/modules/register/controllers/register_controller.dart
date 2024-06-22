import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toko_skincare/app/routes/app_pages.dart';

import '../../../../core/services/user_service.dart';

class RegisterController extends GetxController {
  UserService _userService = UserService();
  var isLoading = false.obs;
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

  void register(String nowa, String pass1, String pass2, String referal) async {
    isLoading.value = true;
    if (pass1 != pass2) {
      Get.snackbar('Failed', 'Password tidak sama');
    } else if (nowa.isEmpty) {
      Get.snackbar('Failed', 'No whatsapp tidak boleh kosong');
    } else {
      try {
        nowa = 'user${nowa.split(' ')[0]}';
        print(pass1);
        print(nowa);
        await _userService.register(
            nowa, pass1, referal.isEmpty ? null : referal);
        Get.snackbar('Success', 'Berhasil mendaftar');
        Get.offNamed(Routes.LOGIN);
      } catch (e) {
        Get.snackbar('Failed to register', e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }
}
