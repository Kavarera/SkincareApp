import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toko_skincare/app/routes/app_pages.dart';

import '../../../../core/services/user_service.dart';

class RegisterController extends GetxController {
  UserService _userService = UserService();
  var isLoading = false.obs;

  var currentBank = "".obs;
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

  void register(
      String nowa, String pass1, String referal, String rekening) async {
    isLoading.value = true;
    if (nowa.isEmpty) {
      Get.snackbar('Failed', 'No whatsapp tidak boleh kosong');
    } else {
      try {
        nowa = 'user${nowa.split(' ')[0]}';
        print(pass1);
        print(nowa);
        bool result = await _userService.register(nowa, pass1,
            referal.isEmpty ? null : referal, rekening, "BANK $currentBank");
        if (result) {
          Get.snackbar('Success', 'Berhasil mendaftar');
          Get.offNamed(Routes.LOGIN);
        }
        throw new Exception('Failed to register');
      } catch (e) {
        Get.snackbar('Failed to register', e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  void changeSelectedBankName(String? value) {
    currentBank.value = value!;
  }
}
