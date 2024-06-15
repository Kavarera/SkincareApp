import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_skincare/app/data/models/user_model.dart';

class ProfileController extends GetxController {
  var user = Rxn<User>();
  late SharedPreferences _preferences;

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

  Future<void> setup() async {
    try {
      _preferences = await SharedPreferences.getInstance();
      String _user = _preferences.getString('user')!;
      print("profile\n$_user");
      print(json.decode(_user));
      user.value = User.fromJson(json.decode(_user));
    } catch (e) {
      Get.snackbar('Failed to load', e.toString());
      print(e);
    }
  }
}
