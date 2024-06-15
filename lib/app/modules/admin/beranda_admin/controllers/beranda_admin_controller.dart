import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BerandaAdminController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final count = 0.obs;
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

  void increment() => count.value++;
}
