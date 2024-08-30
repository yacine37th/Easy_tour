import 'package:flutter_application_1/controller/touristic_guides.dart';
import 'package:get/get.dart';

class TouristicGuidesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TouristicGuidesController());
  }
}
