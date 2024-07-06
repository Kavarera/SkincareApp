import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/beranda_admin_controller.dart';

class ResellerlistView extends GetView {
  ResellerlistView({Key? key}) : super(key: key);
  final BerandaAdminController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.setup(),
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
                          print('tap all');
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
                          print('tap Reseller');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(235, 147, 235, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'RESELLER',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print('tap User');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(235, 147, 235, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'USER',
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
                Expanded(child: Obx(() {
                  if (controller.visibleListUser.isEmpty) {
                    return Center(child: Text('No Data'));
                  } else {
                    return ListView.builder(
                      itemCount: controller.visibleListUser.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Column(
                            children: [
                              Text(
                                controller.visibleListUser
                                    .elementAt(index)
                                    .username,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }))
              ],
            );
          }
        },
      ),
    );
  }
}
