import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<void> onInit() async {
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
