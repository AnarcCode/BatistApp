import 'package:batistapp/models/user_request_model.dart';
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
      QuerySnapshot queryFood = await db
          .collection('food requests')
          .doc(element.id)
          .collection('requests')
          .get();

      final requests = <UserRequestModel>[];

      for (var element in queryFood.docs) {
        requests.add(
          UserRequestModel(
            id: element.id,
            idCreator: element.get('idCreator'),
            user: element.get('name'),
            description: element.get('description'),
            food: List<String>.from(element.get('foods')),
            juice: List<String>.from(element.get('juices')),
            pay: element.get('pay'),
          ),
        );
      }

      foodRequests.add(
        FoodRequestModel(
          id: element.id,
          idCreator: element.get('idCreator'),
          name: element.get('name'),
          foods: List<String>.from(element.get('foods')),
          juices: List<String>.from(element.get('juices')),
          userRequest: requests,
        ),
      );
    }
  }

  Future<void> addFoodRequest() async {}
}
