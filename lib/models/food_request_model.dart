import 'package:batistapp/models/model.dart';
import 'package:batistapp/models/user_request_model.dart';

class FoodRequestModel implements Model {
  final String id;
  final String idCreator;
  final String name;
  final List<String> foods;
  final List<String> juices;
  final List<UserRequestModel>? userRequest;

  FoodRequestModel({
    required this.id,
    required this.idCreator,
    required this.name,
    required this.foods,
    required this.juices,
    this.userRequest,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idCreator': idCreator,
      'name': name,
      'foods': foods,
      'juices': juices,
      'userRequest': userRequest,
    };
  }

  @override
  String toString() {
    return 'FoodRequestModel{id: $id, idCreator: $idCreator, name: $name, foods: $foods, juices: $juices, userRequest: $userRequest}';
  }
}
