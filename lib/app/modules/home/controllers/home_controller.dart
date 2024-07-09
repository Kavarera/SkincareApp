import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toko_skincare/app/data/models/product_model.dart';
import 'package:toko_skincare/app/modules/history/views/history_view.dart';
import 'package:toko_skincare/app/modules/product/views/product_view.dart';
import 'package:toko_skincare/app/modules/profile/views/profile_view.dart';
import 'package:toko_skincare/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  void changePage(int value) {
    currentIndex.value = value;
  }

  var listProduct = <Product>[].obs;
  var selectedProduct = Rxn<Product>();

  @override
  void onInit() {
    super.onInit();
    listProduct.value.add(Product(
        id: 1,
        nama: "Deaco Instant Brightening Series 5in1 ",
        deskripsi:
            '''deskripsi: 'Deaco Instant Brightening Series 5in1 merupakan rangkaian produk skincare yang mampu mencerahkan wajah dalam waktu 7 hari. Rangkaian produk Deaco Brightening Series 5in1 terdiri Whitening Day Cream, Whitening Night cream, Brightening Facial Wash, Whitening Facial Toner, Micellar Water. Rangkaian ini diformulasikan secara khusus dengan bahan aktif yang aman, teruji secara dermatologis, sudah BPOM sehingga dapat membuat kulit cerah seketika, sehat dan ternutrisi.

Kandungan Unggulan:
-  Niacinamide 10%
   Mampu mencerahkan wajah, mengecilkan pori-pori, meratakan warna kulit dan mencegah timbulnya jerawat.

- Hyaluronic Acid
  Mengatasi permasalahan kulit kering, menjaga dan melembapkan kulit secara optimal.

- Vitamin E
  Kandungannya yang kaya akan antioksidan dan anti-inflamasi yang sangat baik bagi kulit. Dapat membantu 
  pertumbuhan kolagen baru pada kulit wajah sehingga wajah lebih kenyal dan lebih cerah. 

Cara Pemakaian:

1. Bersihkan Muka menggunakan Deaco Micellar Water untuk membersihkan Mekup di wajah.
2. Cuci Muka dengan Deaco Brightening Facial Wash untuk memaksimalkan debu, kotoran, dan sisa make 
     up terangkat dari wajah.
3. Keringkan wajah menggunakan tissue, semprotkan Deaco Facial Toner keseluruh bagian wajah secara 
     merata.
4. Diamkan beberapa saat hingga facial toner meresap.
5. Untuk siang hari, gunakan Deaco Brightening Day Cream sebagai  Step terakhir setelah 
    menggunakan facial Toner.
6. Untuk malam hari, gunakan Deaco Brightening Night Cream sebagai  Step terakhir setelah 
    menggunakan facial Toner.
    ''',
        harga: 500000,
        imageUrl: 'assets/images/product1.jpg'));
    listProduct.value.add(Product(
        id: 2,
        nama: 'Deaco Brightening Night Cream',
        deskripsi:
            '''Night Cream mampu mencerahkan wajah, melembapkan, serta menutrisi wajah secara optimal. Sehingga wajah menjadi lebih cerah, kenyal, dan lebih sehat. Diformulasikan secara khusus dengan bahan aktif yang aman dan teruji secara dermatologis.

Best Ingredients:
- Niacinamide 10%
- Vitamin E
- Rice Extract
- Milk

Saran Pemakaian:
Digunakan setiap malam hari sebelum melakukan aktifitas di luar ruangan.
''',
        harga: 150000,
        imageUrl: 'assets/images/product2.jpg'));
    listProduct.value.add(Product(
        id: 3,
        nama: 'Deaco Brightening Day Cream',
        deskripsi: '''
Day Cream mampu mencerahkan wajah, melembapkan, serta menutrisi wajah secara optimal. Sehingga wajah menjadi lebih cerah, kenyal, dan lebih sehat. Diformulasikan secara khusus dengan bahan aktif yang aman dan teruji secara dermatologis.

Best Ingredients:
- Niacinamide 10%
- Vitamin E
- Rice Extract
- Milk

Saran Pemakaian:
Digunakan setiap pagi hari sebelum melakukan aktifitas di luar ruangan.
''',
        harga: 100000,
        imageUrl: 'assets/images/product3.jpg'));
    listProduct.value.add(Product(
        id: 4,
        nama: 'Deaco Brightening Facial Wash 100 ml',
        deskripsi: '''Deaco Skincare Brightening Facial Wash 100 ml

99.4%* High-Purity Niacinamide

BETTER VERSION UPGRADED FORMULA

✨✨✨

N+7 Natural Brightening

Formula with amino acid

gentle foam

moisturizing and glowing

Luminous White Glow Brightening 

✨✨✨

7 Types of Natural Plant Extracts

Gentle Care For Sensitive Skin types

Soothing and Anti-allergy

Safe, Natural and Effective Brightening

Centella

"Polygonum Cuspidatum Root

(Resveratrol)"

Tea Leaves

Chamomile

Rosemary Leaves

Licorice

Baikal skullcap
''',
        harga: 100000,
        imageUrl: 'assets/images/product4.jpg'));
    listProduct.value.add(Product(
        id: 8,
        nama: 'Deaco Brightening Facial Toner 100ml ',
        deskripsi: '''TONER BRIGHTENING
Toner Brightening diperkaya dengan
Niacinamide berfungsi untuk mencerahkan,
meratakan warna kulit, mengurangi
noda hitam. Centella Asiaca Extract,
Allantoin dan Ceramide membantu
menenangkan kulit, mengatasi
kemerahan, melembabkan dan
menyejukkan kulit. Kandungan 4 Types
of Hyaluronic Acid berfungsi menghidrasi
dan membantu memperbaiki skin barrier.

TONER BRIGHTENING
Active Ingredients Concept
• Niacinamide
• 4 Types of Hyaluronic Acid
• Ceramide
• Centella Asiaca Extract
• Allantoin
''',
        harga: 100000,
        imageUrl: 'assets/images/product5.jpg'));
    listProduct.value.add(Product(
        id: 6,
        nama: 'Deaco Micellar Water - 100 ml ',
        deskripsi:
            '''Micellar Water merupakan inovasi pembersih wajah terkini dengan kandungan Allantoin dan Centella Asiatica & Niacinamide yang mampu mengangkat kotoran dan minyak seperti magnet, tanpa perlu dibilas. Teksturnya ringan seperti air, lembut membersihkan kotoran, makeup serta menghilangkan minyak berlebih dari wajah, mata, dan bibir. Teruji secara dermatologi. Diformulasikan agar tidak lengket di wajah, tidak berminyak, dan tanpa parfum: cocok untuk semua jenis kulit termasuk kulit sensitif. 

Cara pemakaian: 
1. Tuang Micellar Water ke kapas secukupnya 
2. Aplikasikan dan tekan kapas ke seluruh wajah 
3. Tarik kapas dan ulangi di seluruh bagian wajah 

Kandungan :

Active Ingredients Concept
• Niacinamide
• Allantoin
• Panthenol
• Vitamin E
• Buerfly Pea Extract

''',
        harga: 50000,
        imageUrl: 'assets/images/product6.jpg'));
    listProduct.value.add(Product(
        id: 7,
        nama: 'Pouch / TAS Skincare',
        deskripsi: '''Tas Pouch / TAS Skincare Exclusive''',
        harga: 50000,
        imageUrl: 'assets/images/product7.jpg'));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  showCurrentPage() {
    switch (currentIndex.value) {
      case 0:
        return ProductView();
      case 1:
        return HistoryView();
      case 2:
        return ProfileView();
      default:
        return Center(
          child: Text('Not Available yet'),
        );
    }
  }

  void navigateToProduct(Product elementAt) {
    selectedProduct.value = elementAt;
    Get.toNamed(Routes.DETAIL_PRODUCT);
  }
}
