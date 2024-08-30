import 'package:flutter_application_1/model/house.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HouseDetailsController extends GetxController {
  final HouseModel house = Get.arguments;
    void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
}
