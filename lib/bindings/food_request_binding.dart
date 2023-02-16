import 'package:get/get.dart';

import 'package:batistapp/controllers/food_request_controller.dart';

class FoodRequestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodRequestController>(
      () => FoodRequestController(),
    );
  }
}
