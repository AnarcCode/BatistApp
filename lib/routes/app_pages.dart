import 'package:batistapp/bindings/add_food_request_binding.dart';
import 'package:batistapp/bindings/food_request_binding.dart';
import 'package:batistapp/bindings/main_binding.dart';
import 'package:batistapp/ui/add_food_request_page.dart';
import 'package:batistapp/ui/food_request_page.dart';
import 'package:batistapp/ui/main_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.ADD_FOOD_REQUEST,
      page: () => const AddFoodRequestPage(),
      binding: AddFoodRequestBinding(),
    ),
    GetPage(
      name: Routes.FOOD_REQUEST,
      page: () => const FoodRequestPage(),
      binding: FoodRequestBinding(),
    ),
  ];
}
