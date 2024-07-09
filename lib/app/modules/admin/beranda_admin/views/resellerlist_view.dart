import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toko_skincare/app/modules/admin/account_detail/controllers/account_detail_controller.dart';
import '../controllers/beranda_admin_controller.dart';

class ResellerlistView extends GetView {
  ResellerlistView({Key? key}) : super(key: key);
  final BerandaAdminController controller = Get.find();
  final AccountDetailController accountController =
      Get.put(AccountDetailController());
  //for username and password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    accountController.updateRole("RESELLER");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            useSafeArea: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            label: Text("Username"),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 3.0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 3.0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: Text(
                              'Create User',
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
                              accountController.resetFields();
                            },
                            icon: Icon(Icons.close),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      value: accountController.listBank[0].name,
                      items: accountController.listBank.map((bank) {
                        return DropdownMenuItem<String>(
                          value: bank.name,
                          child: Text(bank.name),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        accountController.updatebank(newValue!);
                      },
                      decoration: InputDecoration(
                        labelText: 'Bank Name',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 3.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Rekening"),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 3.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text("New Password"),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 3.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.createReseller();
                          },
                          child: Text('Buat Reseller')),
                    )
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Color.fromRGBO(235, 147, 235, 1),
        child: Icon(Icons.add),
        tooltip: 'Add',
      ),
      body: FutureBuilder(
        future: controller.setup(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.changeRole(0);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(235, 147, 235, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'All',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.changeRole(1);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(235, 147, 235, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'RESELLER',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.changeRole(2);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(235, 147, 235, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'USER',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(child: Obx(() {
                  if (controller.visibleListUser.isEmpty) {
                    return Center(child: Text('No Data'));
                  } else if (controller.isLoading.value == true) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.amberAccent,
                      ),
                    );
                  } else {
                    return RefreshIndicator(
                      onRefresh: controller.getAllAccount,
                      child: ListView.builder(
                        itemCount: controller.visibleListUser.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              controller.gotoAccountProfile(
                                  controller.visibleListUser[index]);
                            },
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.visibleListUser
                                      .elementAt(index)
                                      .username,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  controller.visibleListUser
                                      .elementAt(index)
                                      .role,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  controller.deleteAccount(
                                      controller.visibleListUser[index]);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          );
                        },
                      ),
                    );
                  }
                }))
              ],
            );
          }
        },
      ),
    );
  }
}
