import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toko_skincare/app/modules/admin/beranda_admin/views/history_view.dart';
import 'package:toko_skincare/app/modules/admin/beranda_admin/views/resellerlist_view.dart';

import '../controllers/beranda_admin_controller.dart';

class BerandaAdminView extends GetView<BerandaAdminController> {
  BerandaAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deaco Skincare'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            TabBar(
              isScrollable: false,
              controller: controller.tabController,
              labelColor: Colors.white,
              tabs: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(169, 107, 169, 1),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Text('Account'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(169, 107, 169, 1),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Text('Transactions'),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  Center(
                    child: ResellerlistView(),
                  ),
                  Center(
                    child: HistoryView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
