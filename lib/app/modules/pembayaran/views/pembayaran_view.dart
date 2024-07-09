import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pembayaran_controller.dart';

class PembayaranView extends GetView<PembayaranController> {
  PembayaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String qrContent = Get.arguments as String;
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.memory(
              base64Decode(qrContent),
              width: MediaQuery.of(context).size.width, // Adjust width
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text('Error loading image'),
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Tutup'),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
