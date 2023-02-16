import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:batistapp/controllers/add_food_request_controller.dart';

class AddFoodRequestPage extends GetView<AddFoodRequestController> {
  const AddFoodRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar pedido'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Card(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: TextFormField(
                    controller: controller.name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 18,
                      ),
                      label: Text('Nome'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Comidas',
                style: TextStyle(fontSize: 18),
              ),
              Card(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: ListView.builder(
                     physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                    return Text('scac');
                  })
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
