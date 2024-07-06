import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.setup(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                  Text(
                    // 'ee',
                    controller.user.value?.username ?? 'Unknown',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Referral Code',
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                  Text(
                    // 'bbbb',
                    controller.user.value!.referralCodeUsed ??
                        'No Referral Code',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rekening',
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                  Text(
                    // 'aaaa',
                    "${controller.user.value!.rekening ?? 'Rekening'} (${controller.user.value!.bankName ?? 'Bank'})",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.logout();
                      },
                      child: Text('Keluar'),
                    ),
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   left: 0,
                  //   right: 0,
                  //   child: SizedBox(
                  //     width: double.infinity,
                  //     child: ElevatedButton(
                  //       onPressed: () {
                  //         Get.offAllNamed(Routes.LOGIN);
                  //       },
                  //       child: Text('Keluar'),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
