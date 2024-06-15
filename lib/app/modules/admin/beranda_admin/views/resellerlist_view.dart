import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ResellerlistView extends GetView {
  const ResellerlistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResellerlistView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ResellerlistView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
