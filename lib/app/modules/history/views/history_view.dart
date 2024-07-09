import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  HistoryView({Key? key}) : super(key: key);
  var controller = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.historyTransaction.isEmpty) {
            return Center(
              child: Text('No history transactions found'),
            );
          } else {
            return ListView.builder(
              itemCount: controller.historyTransaction.length,
              itemBuilder: (context, index) {
                final product = controller.historyTransaction[index];
                return ListTile(
                  title: Text(product.nama),
                  trailing: Text('\$${product.harga}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
