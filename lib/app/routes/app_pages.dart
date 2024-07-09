import 'package:get/get.dart';

import '../modules/admin/account_detail/bindings/account_detail_binding.dart';
import '../modules/admin/account_detail/views/account_detail_view.dart';
import '../modules/admin/beranda_admin/bindings/beranda_admin_binding.dart';
import '../modules/admin/beranda_admin/views/beranda_admin_view.dart';
import '../modules/admin/new_reseller/bindings/new_reseller_binding.dart';
import '../modules/admin/new_reseller/views/new_reseller_view.dart';
import '../modules/detail_product/bindings/detail_product_binding.dart';
import '../modules/detail_product/views/detail_product_view.dart';
import '../modules/detail_transaksi/bindings/detail_transaksi_binding.dart';
import '../modules/detail_transaksi/views/detail_transaksi_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pembayaran/bindings/pembayaran_binding.dart';
import '../modules/pembayaran/views/pembayaran_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile_edit/bindings/profile_edit_binding.dart';
import '../modules/profile_edit/views/profile_edit_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_EDIT,
      page: () => ProfileEditView(),
      binding: ProfileEditBinding(),
    ),
    GetPage(
      name: _Paths.BERANDA_ADMIN,
      page: () => BerandaAdminView(),
      binding: BerandaAdminBinding(),
    ),
    GetPage(
      name: _Paths.NEW_RESELLER,
      page: () => const NewResellerView(),
      binding: NewResellerBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT,
      page: () => DetailProductView(),
      binding: DetailProductBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_DETAIL,
      page: () => AccountDetailView(),
      binding: AccountDetailBinding(),
    ),
    GetPage(
      name: _Paths.PEMBAYARAN,
      page: () => PembayaranView(),
      binding: PembayaranBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TRANSAKSI,
      page: () => DetailTransaksiView(),
      binding: DetailTransaksiBinding(),
    ),
  ];
}
