import 'package:batistapp/models/model.dart';
import 'package:batistapp/models/user_request_model.dart';

class FoodRequestModel implements Model {
  final String idCreator;
  final String name;
  final List<String> foods;
  final List<UserRequestModel>? userRequest;


  FoodRequestModel({
    required this.idCreator,
    required this.name,
    required this.foods,
    this.userRequest,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'idCreator' : idCreator,
      'name': name,
      'foods': foods,
      'userRequest': userRequest,
    };
  }

  @override
  String toString() {
    return 'FoodRequestModel{idCreator: $idCreator, name: $name, foods: $foods, userRequest: $userRequest}';
  }
}
