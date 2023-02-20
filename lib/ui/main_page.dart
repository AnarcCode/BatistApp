import 'package:batistapp/controllers/main_controller.dart';
import 'package:batistapp/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Batistapp'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            onPressed: () => controller.getFoodRequests(),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Obx(() {
        return GridView.builder(
          padding: const EdgeInsets.all(18),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 20,
          ),
          itemCount: controller.foodRequests.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: const BorderSide(
                    width: 4,
                    color: Colors.purple,
                  ),
                ),
                child: Center(
                  child: Text(
                    controller.foodRequests[index].name,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              onTap: () => Get.toNamed(
                Routes.FOOD_REQUEST,
                arguments: controller.foodRequests[index],
              ),
              onLongPress: () => Get.toNamed(
                Routes.RESUME,
                arguments: controller.foodRequests[index],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_FOOD_REQUEST),
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
