import 'package:flutter_application_1/controller/house_details.dart';
import 'package:get/get.dart';

class HouseDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HouseDetailsController());
  }
}
