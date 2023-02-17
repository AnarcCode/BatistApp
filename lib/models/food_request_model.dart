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

  FoodRequestModel.fromMap(Map<String, dynamic> map)
      : id = map['id'] is String ? map['id'] as String : '',
        idCreator =
            map['idCreator'] is String ? map['idCreator'] as String : '',
        name = map['name'] is String ? map['name'] as String : '',
        foods = map['foods'] is List<String> ? map['foods'] : [],
        juices = map['juices'] is List<String> ? map['juices'] : [],
        userRequest = map['userRequest'] is List<UserRequestModel>
            ? map['userRequest']
            : [];

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
