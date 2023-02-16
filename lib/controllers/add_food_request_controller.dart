import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';

class AddFoodRequestController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final name = TextEditingController();

  final _idDevice = ''.obs;
  String get idDevice => _idDevice.value;
  set idDevice(String value) => _idDevice.value = value;

  final _foods = <String>[].obs;
  List<String> get foods => _foods;
  set foods(List<String> value) => _foods.value = value;

  final _juices = <String>[].obs;
  List<String> get juices => _juices;
  set juices(List<String> value) => _juices.value = value;

  Future<void> addFoodRequest() async {
    if (name.text.isNotEmpty && foods.isNotEmpty && juices.isNotEmpty) {
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        idDevice = build.id;
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        idDevice = data.identifierForVendor!;
      }

      final data = <String, dynamic>{
        'idCreator': idDevice,
        'name': name.text,
        'foods': foods,
        'juices': juices,
      };

      db.collection('food requests').add(data).then((value) {
        Get.back();
        Get.snackbar(
          'Sucesso',
          'Um novo pedido foi criado !',
          backgroundColor: Colors.white,
        );
      });
    } else {
      Get.snackbar(
        'Erro',
        'Verifique as informações do pedido !',
        backgroundColor: Colors.white,
      );
    }
  }
}
