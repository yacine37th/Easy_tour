import 'package:get/get.dart';

import '../controller/agency_details.dart';

class AgencyDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AgencyDetailsController());
  }
}
