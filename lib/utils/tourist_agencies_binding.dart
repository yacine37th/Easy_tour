import 'package:flutter_application_1/controller/tourist_agency.dart';
import 'package:get/get.dart';

class TouristAgenciesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TouristAgenciesController());
  }
}
