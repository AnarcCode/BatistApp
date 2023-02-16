import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:batistapp/models/food_request_model.dart';

class MainController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final foodRequests = <FoodRequestModel>[].obs;

  @override
  Future<void> onInit() async {
    getFoodRequests();
    super.onInit();
  }

  Future<void> getFoodRequests() async {
    QuerySnapshot query = await db.collection('food requests').get();

    for (var element in query.docs) {
      print(element.data());
    }
  }

  Future<void> addFoodRequest() async {}
}
