import 'package:batistapp/models/model.dart';

class ResumeModel implements Model {
  final String name;
  final int amount;

  ResumeModel({
    required this.name,
    required this.amount,
  });

  ResumeModel.fromMap(Map<String, dynamic> map)
      : name = map['name'] is String ? map['name'] as String : '',
        amount = map['amount'] is int ? map['amount'] as int : 0;

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
    };
  }

  @override
  String toString() {
    return 'ResumeModel{name: $name, amount: $amount}';
  }
}
