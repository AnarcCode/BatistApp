import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:batistapp/models/food_request_model.dart';

class FoodRequestController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void onInit() {
    currentRequest = Get.arguments;
    print(currentRequest);
    super.onInit();
  }

  final _currentRequest = FoodRequestModel.fromMap({}).obs;
  FoodRequestModel get currentRequest => _currentRequest.value;
  set currentRequest(FoodRequestModel value) => _currentRequest.value = value;



  final name = TextEditingController();
}
