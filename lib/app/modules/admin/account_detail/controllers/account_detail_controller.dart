import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_skincare/app/data/models/account_model.dart';
import 'package:toko_skincare/app/data/models/user_model.dart';
import 'package:toko_skincare/app/routes/app_pages.dart';
import 'package:toko_skincare/core/services/bank_service.dart';
import 'package:toko_skincare/core/services/user_service.dart';

import '../../../../data/models/bank_model.dart';

class AccountDetailController extends GetxController {
  Rx<String> role = ''.obs;
  Rx<String> bank = ''.obs;
  Rx<String> noRekening = ''.obs;
  Rx<String> password = ''.obs;

  var listBank = <Bank>[].obs;
  var isObscure = true.obs;

  BankService _bankService = BankService();
  UserService _userService = UserService();
  late SharedPreferences _preferences;

  // Dropdown items for role
  final List<String> roles = ['ADMIN', 'USER', 'RESELLER'];
  Rx<String> selectedRole = 'ADMIN'.obs;
  // Update methods
  void updateRole(String role) {
    selectedRole.value = role;
  }

  void updatebank(String newbank) {
    bank.value = newbank;
  }

  void updatenoRekening(String newnoRekening) {
    noRekening.value = newnoRekening;
  }

  void changeObscure() {
    isObscure.value = !isObscure.value;
  }

  void updatePassword(String newPassword) {
    password.value = newPassword;
  }

  void resetFields() {
    role.value = '';
    bank.value = '';
    noRekening.value = '';
    password.value = '';
  }

  void setup() async {
    _preferences = await SharedPreferences.getInstance();
    getAllBank();
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

  void getAllBank() async {
    try {
      User user = User.fromJson(jsonDecode(_preferences.getString('user')!));
      List<dynamic> data = await _bankService.fetchBank(user.access_token!);
      listBank.value = data.map((e) => Bank.fromJson(e)).toList();
      listBank.sort((a, b) => a.name.compareTo(b.name));
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }

  void updateUser(Account account) async {
    try {
      User user = User.fromJson(jsonDecode(_preferences.getString('user')!));
      bool data = await _userService.updateUser(
          account.id,
          user.access_token!,
          selectedRole.value.isEmpty ? null : selectedRole.value,
          bank.value.isEmpty ? null : bank.value,
          noRekening.value.isEmpty ? null : noRekening.value,
          password.value.isEmpty ? null : password.value);
      if (data) {
        Get.snackbar('Success', 'Update berhasil');
        resetFields();
        Get.offAllNamed(Routes.BERANDA_ADMIN);
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }
}
