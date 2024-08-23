import 'package:get/get.dart';

import '../controller/verify_email_controller.dart';

class EmailVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EmailVerificationController());
  }
}
