import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_skincare/app/data/models/account_model.dart';
import 'package:toko_skincare/app/data/models/user_model.dart';
import 'package:toko_skincare/app/routes/app_pages.dart';
import 'package:toko_skincare/core/services/user_service.dart';

class BerandaAdminController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  late SharedPreferences _preferences;
  var isLoading = false.obs;
  var _user = Rxn<User>();
  UserService _userService = UserService();
  var _listAccount = <Account>[];
  var visibleListUser = <Account>[].obs;
  var roleVisible = 0;

  Future<void> getAllAccount() async {
    isLoading.value = true;
    try {
      print('controller access userservice get users');
      List<dynamic> jsonUsers =
          await _userService.getUsers(_user.value!.access_token!);
      print('result received, convert to _listAccount');

      _listAccount = jsonUsers.map((e) => Account.fromJson(e)).toList();
      print(_listAccount.length);
      changeVisibleListUser();
    } catch (e) {
      print('$e');
    } finally {
      isLoading.value = false;
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

  void gotoAccountProfile(Account visibleListUser) {
    Get.toNamed(Routes.ACCOUNT_DETAIL, arguments: visibleListUser);
  }

  void deleteAccount(Account visibleListUser) async {
    try {
      await _userService.deleteAccount(
          _user.value!.access_token!, visibleListUser.id);
      await getAllAccount();
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }

  void changeVisibleListUser() {
    print(roleVisible);
    if (roleVisible == 0) {
      visibleListUser.value = _listAccount;
    } else if (roleVisible == 1) {
      visibleListUser.value =
          _listAccount.where((element) => element.role == "RESELLER").toList();
    } else {
      visibleListUser.value =
          _listAccount.where((element) => element.role == "USER").toList();
    }
  }

  void changeRole(int i) {
    roleVisible = i;
    changeVisibleListUser();
  }

  refreshList() async {
    await getAllAccount();
  }

  void createReseller() {}
}
