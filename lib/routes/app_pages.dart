import 'package:batistapp/bindings/main_binding.dart';
import 'package:batistapp/ui/main_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
  ];
}