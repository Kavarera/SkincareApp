import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_transaksi_controller.dart';

class DetailTransaksiView extends GetView<DetailTransaksiController> {
  DetailTransaksiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaksi Detail'),
      ),
      body: const Center(
        child: Text(
          'DetailTransaksiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
