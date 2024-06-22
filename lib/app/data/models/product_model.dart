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
}
