import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFoodRequestController extends GetxController {
  final name = TextEditingController();

  final _foods = <String>[].obs;
  List<String> get foods => _foods;
  set foods(List<String> value) => _foods.value = value;

  final _juices = <String>[].obs;
  List<String> get juices => _juices;
  set juices(List<String> value) => _juices.value = value;
}
