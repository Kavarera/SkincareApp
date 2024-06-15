import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_skincare/app/data/models/user_model.dart';
import 'package:toko_skincare/app/routes/app_pages.dart';
import 'package:toko_skincare/core/services/user_service.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  late SharedPreferences _sharedPreferences;

  var user = Rxn<User>();
  UserService _userService = UserService();
  void userLogin(String username, String password) async {
    isLoading.value = true;
    _sharedPreferences = await SharedPreferences.getInstance();
    try {
      final result = await _userService.login(username, password);
      user.value = User.fromJson(result['user']);
      user.value?.setToken(result['access_token']);
      //set sharedPreferences
      _sharedPreferences.setString('user', jsonEncode(user.value?.toJson()));
      print(jsonEncode(user.value?.toJson()));
      if (user.value?.role == "ADMIN") {
        Get.offNamed(Routes.BERANDA_ADMIN);
      } else {
        Get.offNamed(Routes.HOME);
      }
    } catch (e) {
      Get.snackbar('failed', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

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
}
