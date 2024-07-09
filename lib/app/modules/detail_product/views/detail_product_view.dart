import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:toko_skincare/app/modules/home/controllers/home_controller.dart';
import '../../../data/models/product_model.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  DetailProductView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Deaco Skincare',
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                          homeController.selectedProduct.value!.imageUrl),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                        bottom: 50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            homeController.selectedProduct.value!.nama,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Rp ${NumberFormat('#,##0', 'id_ID').format(homeController.selectedProduct.value!.harga)}',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(homeController.selectedProduct.value!.deskripsi),
                        ],
                      ),
                    )
                  ]),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.createTransaction(
                            homeController.selectedProduct.value!);
                      },
                      child: Obx(() => controller.isLoading == true
                          ? CircularProgressIndicator()
                          : Text('Beli'))),
                ),
              ),
            ),
          ],
        ));
  }
}
