import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFoodRequestPage extends StatelessWidget {
  const AddFoodRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios),
              )
            ],
          ),
        ],
      ),
    );
  }
}
