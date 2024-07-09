import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/product_model.dart';

class HistoryController extends GetxController {
  var historyTransaction = <Product>[].obs;
  late SharedPreferences pref;
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

  void setup() async {
    pref = await SharedPreferences.getInstance();
    List<Product> products = await getProductsFromSharedPreferences();
    historyTransaction.assignAll(products);
  }
}
