import 'package:batistapp/ui/widgets/food_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:batistapp/controllers/add_food_request_controller.dart';

class AddFoodRequestPage extends GetView<AddFoodRequestController> {
  const AddFoodRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> foods = [
      'Assado de panela',
      'Almondegas',
      'Bisteca suina',
      'Bife com fritas',
      'Carne de Sol com fritas',
      'Cozidão com Pirão',
      'Figado Bovino',
      'Fricasse',
      'Frango ao molho',
      'Linguiça calabresa',
      'Peixe Frito',
      'Peixe ao molho',
      'Peito de frango assado',
      'Peito de frango a milanesa',
      'Pernil cozido',
      'Strogonoff de frango',
    ];

    final List<String> juices = [
      'Abacaxi',
      'Acerola',
      'Cajá',
      'Caju',
      'Goiaba',
      'Tamarindo',
      'Maracuja ',
    ];

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
                  child: Column(
                    children: [
                      for (int i = 0; i < foods.length; i++)
                        Obx(() {
                          return FoodItem(
                            food: foods[i],
                            value: controller.foods.contains(foods[i]),
                            onChanged: (bool? value) {
                              if (value == true &&
                                  !controller.foods.contains(foods[i])) {
                                controller.foods.add(foods[i]);
                              }
                              if (value == false &&
                                  controller.foods.contains(foods[i])) {
                                controller.foods.remove(foods[i]);
                              }
                            },
                          );
                        }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Sucos',
                style: TextStyle(fontSize: 18),
              ),
              Card(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    children: [
                      for (int i = 0; i < juices.length; i++)
                        Obx(() {
                          return FoodItem(
                            food: juices[i],
                            value: controller.juices.contains(juices[i]),
                            onChanged: (bool? value) {
                              if (value == true &&
                                  !controller.juices.contains(juices[i])) {
                                controller.juices.add(juices[i]);
                              }
                              if (value == false &&
                                  controller.juices.contains(juices[i])) {
                                controller.juices.remove(juices[i]);
                              }
                            },
                          );
                        }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: Get.height - 20,
                height: Get.height * 0.075,
                color: Colors.purple,
                child: TextButton(
                  onPressed: controller.addFoodRequest,
                  child: const Text(
                    'Confirmar pedido',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
