import 'package:batistapp/controllers/main_controller.dart';
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
      body: GridView.builder(
        padding: const EdgeInsets.all(18),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 20,
        ),
        itemCount: 26,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: const BorderSide(
                width: 4,
                color: Colors.deepPurple,
              ),
            ),
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Center(
                child: Text(
                  String.fromCharCode(65 + index),
                  style: const TextStyle(
                    fontSize: 110,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addFoodRequest(),
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
