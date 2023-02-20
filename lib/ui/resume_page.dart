import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:batistapp/controllers/resume_controller.dart';

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
                'Peidos',
                style: TextStyle(fontSize: 18),
              ),
              Card(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    children: [],
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
