import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:batistapp/controllers/resume_controller.dart';
import 'package:batistapp/ui/widgets/resume_item.dart';

class ResumePage extends GetView<ResumeController> {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo'),
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
              const Text(
                'Pedidos',
                style: TextStyle(fontSize: 18),
              ),
              for (int i = 0;
                  i < controller.currentRequest.userRequest!.length;
                  i++)
                Card(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: ResumeItem(
                      userRequest: controller.currentRequest.userRequest![i],
                    ),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Resumo',
                style: TextStyle(fontSize: 18),
              ),
              Card(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          for (var element in controller.resumeFood)
                            Text(
                                '${element.name}: ${element.amount} ${element.amount > 1 ? 'unidades' : 'unidade'}'),
                          for (var element in controller.resumeJuice)
                            Text(
                                'Suco de ${element.name}: ${element.amount} ${element.amount > 1 ? 'unidades' : 'unidade'}'),
                        ],
                      ),
                    ],
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
