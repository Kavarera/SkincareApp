import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Product {
  int id;
  String nama;
  String deskripsi;
  double harga;
  String imageUrl;

  Product(
      {required this.id,
      required this.nama,
      required this.deskripsi,
      required this.harga,
      required this.imageUrl});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['deskripsi'] = deskripsi;
    data['harga'] = harga;
    return data;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      harga: json['harga'],
      imageUrl: json['imageUrl'],
    );
  }
}

Future<void> saveProductsToSharedPreferences(List<Product> products) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> productJsonList =
      products.map((product) => jsonEncode(product.toJson())).toList();
  await prefs.setStringList('historyList', productJsonList);
}

Future<List<Product>> getProductsFromSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? productJsonList = prefs.getStringList('historyList');

  if (productJsonList != null) {
    List<Product> products = productJsonList
        .map((productJson) => Product.fromJson(jsonDecode(productJson)))
        .toList();
    return products;
  } else {
    // Return an empty list if no products are found
    return [];
  }
}
