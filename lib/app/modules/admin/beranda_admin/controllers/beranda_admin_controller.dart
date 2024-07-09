import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_skincare/app/data/models/account_model.dart';
import 'package:toko_skincare/app/data/models/transaction_model.dart';
import 'package:toko_skincare/app/data/models/user_model.dart';
import 'package:toko_skincare/app/routes/app_pages.dart';
import 'package:toko_skincare/core/services/transaction_service.dart';
import 'package:toko_skincare/core/services/user_service.dart';

class BerandaAdminController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  late SharedPreferences _preferences;
  var isLoading = false.obs;
  var _user = Rxn<User>();
  UserService _userService = UserService();
  TransactionService _transactionService = TransactionService();
  var _listAccount = <Account>[];
  var visibleListUser = <Account>[].obs;
  var roleVisible = 0;
  //transaction
  var _listTransaction = <Transaction>[];
  var visibleListTransaction = <Transaction>[].obs;
  var transactionTypeVisible = 0;

  var isObscure = true.obs;

  List<Account> getListAccount() => _listAccount;

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

  void _changeTransactionVisible() {
    print(transactionTypeVisible);
    if (transactionTypeVisible == 0) {
      visibleListTransaction.value = _listTransaction;
      print('_listTransaction length = ${_listTransaction.length}');
    } else if (transactionTypeVisible == 1) {
      visibleListTransaction.value = _listTransaction
          .where((element) => element.status == "PENDING")
          .toList();
    } else {
      visibleListTransaction.value = _listTransaction
          .where((element) => element.status == "SUCCESS")
          .toList();
    }
  }

  void changeTransactionType(int i) {
    transactionTypeVisible = i;
    _changeTransactionVisible();
  }

  Future<void> getAllHistory() async {
    isLoading.value = true;
    print('get all history');
    try {
      // await getAllAccount();
      print('controller access transactionservice get transaction');
      List<dynamic> jsonUsers = await _transactionService.getHistories();
      print('result received, convert to _listAccount');

      _listTransaction = jsonUsers.map((e) => Transaction.fromJson(e)).toList();
      print(_listTransaction.length);
      _changeTransactionVisible();
    } catch (e) {
      print('$e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> setupHistory() async {
    print('setup History');
    getAllHistory();
  }

  Future<void> setup() async {
    _preferences = await SharedPreferences.getInstance();
    String? value = _preferences.getString('user');
    if (value != null) {
      _user.value = User.fromJson(jsonDecode(value));
      getAllAccount();
      getAllHistory();
    }
  }

  bool checkAdmin() {
    return _user.value?.role == "ADMIN";
  }

  void changeObscure() {
    isObscure.value = !isObscure.value;
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

  void gotoAccountProfile(Account visibleListUser, {bool transaction = false}) {
    if (checkAdmin()) {
      Get.toNamed(Routes.ACCOUNT_DETAIL, arguments: visibleListUser);
    }
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

  void createReseller(
      String username, String password, String norek, String bankName) async {
    bool result = false;
    try {
      result = await _userService.createReseller(
          _user.value!.access_token!, username, password, norek, bankName);

      if (result) {
        Get.back();
      }
    } catch (e) {
      Get.snackbar('Error', "$e");
    } finally {
      if (result) {
        Get.snackbar('Success', 'Berhasil membuat reseller');
        getAllAccount();
      }
    }
  }
}
