import 'package:flutter_application_1/controller/touristic_guide_details.dart';
import 'package:get/get.dart';

class TouristicGuideDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TouristicGuideDetailsController());
  }
}
