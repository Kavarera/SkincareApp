import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_reseller_controller.dart';

class NewResellerView extends GetView<NewResellerController> {
  const NewResellerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewResellerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewResellerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
