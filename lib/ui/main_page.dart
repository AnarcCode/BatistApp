import 'package:batistapp/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Batistapp'),
        actions: [
          IconButton(
            onPressed: () => controller.getUsers(),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
    );
  }
}
