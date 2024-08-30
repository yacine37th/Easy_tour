import 'package:get/get.dart';

import '../controller/houses.dart';

class HousesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HousesController());
  }
}
