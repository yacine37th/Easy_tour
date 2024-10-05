import 'package:get/get.dart';

import '../controller/activities.dart';

class ActivitiesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ActivitiesController());
  }
}
