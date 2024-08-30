import 'package:flutter_application_1/model/touristic_guide.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TouristicGuideDetailsController extends GetxController {
  final TouristicGuideModel touristicGuideModel = Get.arguments;
  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
}
