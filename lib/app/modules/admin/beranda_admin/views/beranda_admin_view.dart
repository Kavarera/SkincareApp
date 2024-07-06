import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/beranda_admin_controller.dart';

class BerandaAdminView extends GetView<BerandaAdminController> {
  BerandaAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Natural Indonesia'),
      ),
      body: Column(
        children: [
          TabBar(
            isScrollable: false,
            controller: controller.tabController,
            tabs: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(169, 107, 169, 1),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text('Test'),
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
                  child: Text('Test'),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                Center(
                  child: Text('aaa'),
                ),
                Center(
                  child: Text('aaa'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
