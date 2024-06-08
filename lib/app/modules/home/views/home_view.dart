import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            Obx(() => controller.showCurrentPage()),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                  left: 20,
                  right: 20,
                ),
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Obx(
                    () => BottomNavigationBar(
                      onTap: (value) {
                        controller.changePage(value);
                      },
                      currentIndex: controller.currentIndex.value,
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          tooltip: "Home",
                          label: "Home",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.history_sharp),
                          tooltip: "Home",
                          label: "Home",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          tooltip: "Home",
                          label: "Home",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
