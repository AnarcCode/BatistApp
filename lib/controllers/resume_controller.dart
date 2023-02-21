// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:batistapp/models/food_request_model.dart';
import 'package:batistapp/models/resume_model.dart';

class ResumeController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void onInit() {
    currentRequest = Get.arguments;
    calculateFoodRequestResume();
    super.onInit();
  }

  final _currentRequest = FoodRequestModel.fromMap({}).obs;
  FoodRequestModel get currentRequest => _currentRequest.value;
  set currentRequest(FoodRequestModel value) => _currentRequest.value = value;

  final resumeFood = <ResumeModel>[].obs;
  final resumeJuice = <ResumeModel>[].obs;

  void calculateFoodRequestResume() {
    var mapFood = {};
    var mapJuice = {};

    for (var element in currentRequest.userRequest!) {
      element.food!.forEach((element) {
        if (!mapFood.containsKey(element)) {
          mapFood[element] = 1;
        } else {
          mapFood[element] += 1;
        }
      });
    }

    for (var element in currentRequest.userRequest!) {
      element.juice!.forEach((element) {
        if (!mapJuice.containsKey(element)) {
          mapJuice[element] = 1;
        } else {
          mapJuice[element] += 1;
        }
      });
    }

    mapFood.forEach(
      (key, value) => resumeFood.add(
        ResumeModel(name: key, amount: value),
      ),
    );

    mapJuice.forEach(
      (key, value) => resumeJuice.add(
        ResumeModel(name: key, amount: value),
      ),
    );
  }
}
