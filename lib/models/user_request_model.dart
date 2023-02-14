import 'package:batistapp/models/model.dart';

class UserRequestModel implements Model {
  final String user;
  final String food;
  final bool? pay;


  UserRequestModel({
    required this.user,
    required this.food,
    this.pay,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'user' : user,
      'food': food,
      'pay': pay,
    };
  }

  @override
  String toString() {
    return 'UserRequestModel{user: $user, food: $food, pay: $pay}';
  }
}