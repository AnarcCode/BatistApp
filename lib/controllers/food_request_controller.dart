import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:batistapp/models/food_request_model.dart';

class FoodRequestController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void onInit() {
    currentRequest = Get.arguments;
    super.onInit();
  }

  final _currentRequest = FoodRequestModel.fromMap({}).obs;
  FoodRequestModel get currentRequest => _currentRequest.value;
  set currentRequest(FoodRequestModel value) => _currentRequest.value = value;

  final name = TextEditingController();

  final description = TextEditingController();

  final _foods = <String>[].obs;
  List<String> get foods => _foods;
  set foods(List<String> value) => _foods.value = value;

  final _juices = <String>[].obs;
  List<String> get juices => _juices;
  set juices(List<String> value) => _juices.value = value;

}
