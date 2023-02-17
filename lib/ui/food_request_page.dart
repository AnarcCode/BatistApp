import 'package:batistapp/ui/widgets/choose_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:batistapp/controllers/food_request_controller.dart';

class FoodRequestPage extends GetView<FoodRequestController> {
  const FoodRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      for (int i = 0;
                          i < controller.currentRequest.foods.length;
                          i++)
                        Obx(
                          () {
                            int count = 0;

                            for (var element in controller.foods) {
                              if (element ==
                                  controller.currentRequest.foods[i]) {
                                count++;
                              }
                            }

                            return ChooseItem(
                              food: controller.currentRequest.foods[i],
                              value: count.toString(),
                              onChangedLess: () {
                                if (controller.foods.contains(
                                    controller.currentRequest.foods[i])) {
                                  controller.foods.remove(
                                      controller.currentRequest.foods[i]);
                                }
                              },
                              onChangedPlus: () {
                                controller.foods
                                    .add(controller.currentRequest.foods[i]);
                              },
                            );
                          },
                        ),
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
                      for (int i = 0;
                          i < controller.currentRequest.juices.length;
                          i++)
                        Obx(
                          () {
                            int count = 0;

                            for (var element in controller.juices) {
                              if (element ==
                                  controller.currentRequest.juices[i]) {
                                count++;
                              }
                            }

                            return ChooseItem(
                              food: controller.currentRequest.juices[i],
                              value: count.toString(),
                              onChangedLess: () {
                                if (controller.juices.contains(
                                    controller.currentRequest.juices[i])) {
                                  controller.juices.remove(
                                      controller.currentRequest.juices[i]);
                                }
                              },
                              onChangedPlus: () {
                                controller.juices
                                    .add(controller.currentRequest.juices[i]);
                              },
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: TextFormField(
                    controller: controller.description,
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
                      label: Text('Descrição'),
                    ),
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
                  onPressed: controller.foodRequest,
                  child: Text(
                    controller.isEdit ? 'Atualizar pedido' : 'Confirmar pedido',
                    style: const TextStyle(
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
