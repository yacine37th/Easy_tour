import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/theme/main_colors.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../functions/functions.dart';
import '../model/tourist_agency.dart';

class AgencyDetailsController extends GetxController {
  final TouristAgencyModel agency = Get.arguments;
  final formKey = GlobalKey<FormState>();

  // Add TextEditingControllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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

  String? name;
  String? phone;

  Future<void> makeReservation() async {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "انتظر من فضلك",
        content: const CircularProgressIndicator(
          color: AppColors.kPrimary2,
        ));

    try {
      var doc =
          FirebaseFirestore.instance.collection("reservationWakalat").doc();
      doc.set({
        "reservationWakalatId": doc.id,
        "reservationWakalatUserId": currentUserInfos.uID,
        "reservationWakalatUserName": name,
        "reservationWakalatHousePicture": agency.imageUrl[0],
        "reservationWakalatPhone": phone,
      });

      // Clear the text fields after successful reservation
      formKey.currentState?.reset();
      nameController.clear();
      phoneController.clear();
      name = '';
      phone = '';

      Get.back();
      MainFunctions.successSnackBar("Réservation réussie");
    } catch (e) {
      // Handle error
      Get.back();
      // MainFunctions.errorSnackBar("Erreur lors de la réservation");
    }
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: nameController, // Use the controller
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    onSaved: (username) {
                      name = username!;
                    },
                    onChanged: (username) {
                      name = username.trim();
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "الرجاء ادخال الاسم و اللقب";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "الاسم و اللقب...",
                      prefixIcon: const Icon(
                        Icons.person,
                        color: AppColors.greenColor,
                        size: 25,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.kLine),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      fillColor: AppColors.inputBg,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.greenColor),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.kLine),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.KError),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: phoneController, // Use the controller
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    onSaved: (phoneNumber) {
                      phone = phoneNumber!;
                    },
                    onChanged: (phoneNumber) {
                      phone = phoneNumber.trim();
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "الرجاء ادخال رقم الهاتف";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "رقم الهاتف ...",
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: AppColors.greenColor,
                        size: 25,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.kLine),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      fillColor: AppColors.inputBg,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.greenColor),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.kLine),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.KError),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          makeReservation();
                          Navigator.of(context).pop();
                        }
                      },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            AppColors.greenColor,
                          ),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)))),
                      child: Container(
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          "متابعة ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void onClose() {
    // Dispose the controllers when the controller is disposed
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
