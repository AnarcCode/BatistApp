import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:batistapp/models/food_request_model.dart';

class FoodRequestController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void onInit() async {
    currentRequest = Get.arguments;
    if (currentRequest.userRequest!.isNotEmpty) {
      for (var element in currentRequest.userRequest!) {
        final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

        if (Platform.isAndroid) {
          var build = await deviceInfoPlugin.androidInfo;
          idDevice = build.id;
        } else if (Platform.isIOS) {
          var data = await deviceInfoPlugin.iosInfo;
          idDevice = data.identifierForVendor!;
        }
        if (element.idCreator == idDevice) {
          isEdit = true;
          idEdit = element.id;
          name.text = element.user;
          description.text = element.description!;
          foods = element.food!;
          juices = element.juice!;
        }
      }
    }

    super.onInit();
  }

  final name = TextEditingController();
  final description = TextEditingController();

  final _isEdit = false.obs;
  bool get isEdit => _isEdit.value;
  set isEdit(bool value) => _isEdit.value = value;

  final _currentRequest = FoodRequestModel.fromMap({}).obs;
  FoodRequestModel get currentRequest => _currentRequest.value;
  set currentRequest(FoodRequestModel value) => _currentRequest.value = value;

  final _idEdit = ''.obs;
  String get idEdit => _idEdit.value;
  set idEdit(String value) => _idEdit.value = value;

  final _idDevice = ''.obs;
  String get idDevice => _idDevice.value;
  set idDevice(String value) => _idDevice.value = value;

  final _foods = <String>[].obs;
  List<String> get foods => _foods;
  set foods(List<String> value) => _foods.value = value;

  final _juices = <String>[].obs;
  List<String> get juices => _juices;
  set juices(List<String> value) => _juices.value = value;

  Future<void> foodRequest() async {
    if (name.text.isNotEmpty && (foods.isNotEmpty || juices.isNotEmpty)) {
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
        'description': description.text,
        'pay': false,
      };

      if (isEdit) {
        db
            .collection('food requests')
            .doc(currentRequest.id)
            .collection('requests')
            .doc(idEdit)
            .set(data)
            .then((value) {
          Get.back();
          Get.snackbar(
            'Sucesso',
            'Um novo pedido foi criado !',
            backgroundColor: Colors.white,
          );
        });
      } else {
        db
            .collection('food requests')
            .doc(currentRequest.id)
            .collection('requests')
            .add(data)
            .then((value) {
          Get.back();
          Get.snackbar(
            'Sucesso',
            'Um novo pedido foi criado !',
            backgroundColor: Colors.white,
          );
        });
      }
    } else {
      Get.snackbar(
        'Erro',
        'Verifique as informações do pedido !',
        backgroundColor: Colors.white,
      );
    }
  }

  Future<void> cancelFoodRequest() async {
    db
        .collection('food requests')
        .doc(currentRequest.id)
        .collection('requests')
        .doc(idEdit)
        .delete()
        .then(
      (value) {
        Get.back();
        Get.snackbar(
          'Sucesso',
          'Seu pedido foi excluído !',
          backgroundColor: Colors.white,
        );
      },
    );
  }
}
