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
    );
  }
}
