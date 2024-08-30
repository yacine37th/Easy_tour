import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/touristic_guide.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../functions/functions.dart';
import '../theme/main_colors.dart';

class TouristicGuideDetailsController extends GetxController {
  final TouristicGuideModel touristicGuideModel = Get.arguments;
  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
   Future<void> order() async {
    var doc =
        await FirebaseFirestore.instance.collection("touristicGuideOrders").doc();

    Get.defaultDialog(
      title: 'تاكيد',
      middleText: '? هل أنت متأكد أنك تريد الحجز ',
      textConfirm: 'نعم',
      textCancel: 'لا',
      confirmTextColor: Colors.white,
      buttonColor: AppColors.greenColor,
      onConfirm: () {
        print('Élément supprimé');
        doc.set({
          "touristicGuideOrderId": doc.id,
          "touristicGuideOrderAgencyName": touristicGuideModel.name,
          "touristicGuideOrderAgencyPicture": touristicGuideModel.image,
          "touristicGuideOrder": doc.id,
        });
        MainFunctions.successSnackBar("تم الحجز");
        // doc.delete();
        Get.back();
      },
      onCancel: () {
        print('Suppression annulée');
      },
    );
  }
}