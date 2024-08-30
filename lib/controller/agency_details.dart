import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/main_colors.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../functions/functions.dart';
import '../model/tourist_agency.dart';

class AgencyDetailsController extends GetxController {
  final TouristAgencyModel agency = Get.arguments;
  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> order() async {
    var doc =
        await FirebaseFirestore.instance.collection("agenciesOrders").doc();

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
          "agenciesOrderId": doc.id,
          "agenciesOrderAgencyName": agency.name,
          "agenciesOrderAgencyPicture": agency.imageUrl,
          "agenciesOrder": doc.id,
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
