import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toko_skincare/app/routes/app_pages.dart';

import '../controllers/beranda_admin_controller.dart';

class HistoryView extends GetView {
  HistoryView({Key? key}) : super(key: key);
  final BerandaAdminController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.setupHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.changeTransactionType(0);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(235, 147, 235, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'All',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.changeTransactionType(1);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(235, 147, 235, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'Pending',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.changeTransactionType(2);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(235, 147, 235, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'SUCCESS',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    if (controller.visibleListTransaction.isEmpty) {
                      return Center(child: Text('No Data'));
                    } else if (controller.isLoading.value == true) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.amberAccent,
                        ),
                      );
                    } else {
                      return RefreshIndicator(
                        onRefresh: controller.getAllHistory,
                        child: ListView.builder(
                          itemCount: controller.visibleListTransaction.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_TRANSAKSI,
                                      arguments: controller
                                          .visibleListTransaction
                                          .elementAt(index));
                                },
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.visibleListTransaction
                                          .elementAt(index)
                                          .id
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: controller
                                                      .visibleListTransaction
                                                      .elementAt(index)
                                                      .status ==
                                                  "PENDING"
                                              ? Colors.blue[200]
                                              : controller.visibleListTransaction
                                                          .elementAt(index)
                                                          .status ==
                                                      "SUCCESS"
                                                  ? Colors.green[200]
                                                  : Colors.red[200]),
                                      child: Text(
                                        controller.visibleListTransaction
                                            .elementAt(index)
                                            .status,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      controller
                                              .getListAccount()
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  controller
                                                      .visibleListTransaction
                                                      .elementAt(index)
                                                      .customerId)
                                              .username ??
                                          "Unknown",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "| Amount : ",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      controller.visibleListTransaction
                                          .elementAt(index)
                                          .amount
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        ),
                      );
                    }
                  }),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
