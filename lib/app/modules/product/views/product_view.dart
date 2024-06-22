import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:toko_skincare/app/modules/product/views/widget_product.dart';
import 'package:toko_skincare/app/routes/app_pages.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  ProductView({Key? key}) : super(key: key);
  final List<BannerModel> _listBanners = [
    BannerModel(imagePath: 'assets/images/banner1.jpeg', id: '1'),
    BannerModel(imagePath: 'assets/images/banner2.png', id: '2'),
  ];

  @override
  Widget build(BuildContext context) {
    HomeController hcontroller = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            BannerCarousel(
              height: 180,
              width: double.infinity,
              customizedIndicators: IndicatorModel.animation(
                  width: 20, height: 5, spaceBetween: 2, widthAnimation: 50),
              activeColor: Theme.of(context).primaryColor,
              disableColor: Colors.grey,
              animation: true,
              borderRadius: 15,
              indicatorBottom: true,
              banners: _listBanners,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 8,
                right: 8,
                bottom: 80,
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Jumlah kolom
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio:
                      0.75, // Rasio aspek untuk menyesuaikan ukuran kartu
                ),
                itemCount: hcontroller.listProduct.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      hcontroller.navigateToProduct(
                          hcontroller.listProduct.value.elementAt(index));
                    },
                    child: ProductCard(
                      product: hcontroller.listProduct.value.elementAt(index),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
