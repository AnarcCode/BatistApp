import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> getUsers() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot query = await db.collection('users').get();

    for (var element in query.docs) {
      print(element.data());
    }
  }
}
