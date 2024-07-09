import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:toko_skincare/app/data/models/account_model.dart';

import '../controllers/account_detail_controller.dart';

class AccountDetailView extends GetView<AccountDetailController> {
  AccountDetailView({Key? key}) : super(key: key);
  final Account _account = Get.arguments as Account;
  @override
  Widget build(BuildContext context) {
    controller.setup();
    return Scaffold(
        appBar: AppBar(
          title: Text('${_account.username.toUpperCase()} Detail'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Username',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  _account.username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Role',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  _account.role,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Referral Code',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "${_account.referralCodeUsed}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Bank Information',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "${_account.bankName} (${_account.noRekening})",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.getAllBank();
                        showModalBottomSheet(
                          isScrollControlled: true,
                          useSafeArea: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Center(
                                          child: Text(
                                            'Update ${_account.username}',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: IconButton(
                                          onPressed: () {
                                            Get.back();
                                            controller.resetFields();
                                          },
                                          icon: Icon(Icons.close),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  DropdownButtonFormField<String>(
                                    dropdownColor: Colors.white,
                                    value: controller.selectedRole.value,
                                    items: controller.roles.map((role) {
                                      return DropdownMenuItem<String>(
                                        value: role,
                                        child: Text(role),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      controller.updateRole(newValue!);
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Role',
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 3.0),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 3.0),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DropdownButtonFormField<String>(
                                    dropdownColor: Colors.white,
                                    value: controller.listBank[0].name,
                                    items: controller.listBank.map((bank) {
                                      return DropdownMenuItem<String>(
                                        value: bank.name,
                                        child: Text(bank.name),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      controller.updatebank(newValue!);
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Bank Name',
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 3.0),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 3.0),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      controller.updatenoRekening(value);
                                    },
                                    decoration: InputDecoration(
                                      label: Text("Rekening"),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 3.0),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 3.0),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(
                                    () => TextField(
                                      obscureText: controller.isObscure.value,
                                      onChanged: (value) {
                                        controller.updatePassword(value);
                                      },
                                      decoration: InputDecoration(
                                          label: Text("New Password"),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue, width: 3.0),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 3.0),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          suffix: InkWell(
                                            onTap: () {
                                              controller.changeObscure();
                                            },
                                            child: Icon(
                                                controller.isObscure.value
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          controller.updateUser(_account);
                                        },
                                        child: Text('Submit')),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text('Update')),
                )
              ],
            ),
          ),
        ));
  }
}
