import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodRequestPage extends StatelessWidget {
  const FoodRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolher pedido'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
