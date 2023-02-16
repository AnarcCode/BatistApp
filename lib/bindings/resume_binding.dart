import 'package:get/get.dart';

import 'package:batistapp/controllers/resume_controller.dart';

class ResumeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResumeController>(
      () => ResumeController(),
    );
  }
}
