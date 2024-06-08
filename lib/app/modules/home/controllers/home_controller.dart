import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toko_skincare/app/modules/history/views/history_view.dart';
import 'package:toko_skincare/app/modules/login/views/login_view.dart';
import 'package:toko_skincare/app/modules/product/views/product_view.dart';
import 'package:toko_skincare/app/modules/profile/views/profile_view.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  void changePage(int value) {
    currentIndex.value = value;
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

  showCurrentPage() {
    switch (currentIndex.value) {
      case 0:
        return ProductView();
      case 1:
        return HistoryView();
      case 2:
        return ProfileView();
      default:
        return Center(
          child: Text('Not Available yet'),
        );
    }
  }
}
