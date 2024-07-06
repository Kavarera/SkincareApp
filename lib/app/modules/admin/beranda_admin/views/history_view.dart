import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HistoryView extends GetView {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'HistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
