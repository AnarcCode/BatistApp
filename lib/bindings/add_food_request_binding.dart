import 'package:get/get.dart';

import 'package:batistapp/controllers/add_food_request_controller.dart';

class AddFoodRequestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddFoodRequestController>(
      () => AddFoodRequestController(),
    );
  }
}
