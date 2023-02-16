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

    foodRequests.clear();

    for (var element in query.docs) {
      foodRequests.add(
        FoodRequestModel(
          id: element.id,
          idCreator: element.get('idCreator'),
          name: element.get('name'),
          foods: List<String>.from(element.get('foods')),
          juices: List<String>.from(element.get('juices')),
        ),
      );
    }
  }

  Future<void> addFoodRequest() async {}
}
