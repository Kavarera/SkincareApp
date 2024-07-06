import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_skincare/app/data/models/account_model.dart';
import 'package:toko_skincare/app/data/models/user_model.dart';
import 'package:toko_skincare/core/services/user_service.dart';

class BerandaAdminController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  late SharedPreferences _preferences;
  var _user = Rxn<User>();
  UserService _userService = UserService();
  var _listAccount = <Account>[];
  var visibleListUser = <Account>[].obs;

  Future<void> getAllAccount() async {
    try {
      print('controller access userservice get users');
      List<dynamic> jsonUsers =
          await _userService.getUsers(_user.value!.access_token!);
      print('result received, convert to _listAccount');

      _listAccount = jsonUsers.map((e) => Account.fromJson(e)).toList();
      visibleListUser.value = _listAccount;
    } catch (e) {
      print('$e');
    }
  }

  Future<void> setup() async {
    _preferences = await SharedPreferences.getInstance();
    String? value = _preferences.getString('user');
    if (value != null) {
      _user.value = User.fromJson(jsonDecode(value));
      await getAllAccount();
    }
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
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
