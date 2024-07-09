import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toko_skincare/app/routes/app_pages.dart';

import '../../../../core/services/bank_service.dart';
import '../../../../core/services/user_service.dart';
import '../../../data/models/bank_model.dart';
import '../../../data/models/user_model.dart';

class RegisterController extends GetxController {
  UserService _userService = UserService();
  BankService _bankService = BankService();

  var isLoading = false.obs;
  var listBank = <Bank>[].obs;

  var currentBank = "".obs;

  Future<void> getAllBank() async {
    try {
      List<dynamic> data = await _bankService.fetchBank();
      listBank.value = data.map((e) => Bank.fromJson(e)).toList();
      listBank.sort((a, b) => a.name.compareTo(b.name));
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    setup();
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
        bool result = await _userService.register(nowa, pass1,
            referal.isEmpty ? null : referal, rekening, currentBank.value);
        if (result) {
          Get.back();
        }
      } catch (e) {
        Get.snackbar('Failed to register', e.toString());
      } finally {
        isLoading.value = false;
        Get.snackbar('Success', 'Berhasil mendaftar');
      }
    }
  }

  void changeSelectedBankName(String? value) {
    currentBank.value = value!;
  }

  void setup() async {
    await getAllBank();
  }
}
