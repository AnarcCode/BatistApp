import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:batistapp/models/food_request_model.dart';

class ResumeController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void onInit() {
    currentRequest = Get.arguments;

    super.onInit();
  }

  final _currentRequest = FoodRequestModel.fromMap({}).obs;
  FoodRequestModel get currentRequest => _currentRequest.value;
  set currentRequest(FoodRequestModel value) => _currentRequest.value = value;
}
