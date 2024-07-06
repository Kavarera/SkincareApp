import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toko_skincare/app/modules/register/views/register_view.dart';
import 'package:toko_skincare/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: GoogleFonts.poppins(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Username / Whatsapp Number",
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.userLogin(
                      _usernameController.text, _passwordController.text);
                },
                child: Obx(
                  () => controller.isLoading.value
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Doesnt have and account? ',
                    style: GoogleFonts.poppins(),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: Text(
                      'Register',
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
