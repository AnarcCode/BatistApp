import 'package:batistapp/models/model.dart';

class UserRequestModel implements Model {
  final String id;
  final String idCreator;
  final String user;
  final String description;
  final List<String>? food;
  final List<String>? juice;
  final bool? pay;

  UserRequestModel({
    required this.id,
    required this.idCreator,
    required this.user,
    required this.description,
    this.food,
    this.juice,
    this.pay,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idCreator': idCreator,
      'user': user,
      'food': food,
      'juice': juice,
      'pay': pay,
    };
  }

  @override
  String toString() {
    return 'UserRequestModel{id: $id, idCreator: $idCreator, user: $user, description: $description, food: $food, juice: $juice, pay: $pay}';
  }
}
