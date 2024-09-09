import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/model/house.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/main_colors.dart';

class HouseDetailsController extends GetxController {
  final HouseModel house = Get.arguments;
  final formKey = GlobalKey<FormState>();

  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  String? name;
  String? phone;
  Future<void> makeReservation() async {
    var doc = FirebaseFirestore.instance.collection("reservations").doc();
    doc.set({
      "reservationId": doc.id,
      "reservationUserId": currentUserInfos.uID,
      "reservationUserName": currentUserInfos.name,
      "reservationUserEmail": currentUserInfos.email,
      "reservationHousePicture": house.imageUrl[0],
      // "reservationPhoneUser": phone,
    });
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      // backgroundColor: AppColors.gre,
      
      context: context,
      isScrollControlled:
          true, // Allow the bottom sheet to be taller than the screen
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
                    initialValue: name,
                    decoration: InputDecoration(
                      hintText: "الاسم و اللقب...",
                      errorMaxLines: 2,
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
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    onSaved: (username) {
                      phone = username!;
                    },
                    onChanged: (username) {
                      phone = username.trim();
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "الرجاء ادخال رقم الهاتف";
                      }
                      return null;
                    },
                    initialValue: phone,
                    decoration: InputDecoration(
                      hintText: "رقم الهاتف ...",
                      errorMaxLines: 2,
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
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Handle form submission
                  //     // print('Name: ${_nameController.text}');
                  //     // print('Phone Number: ${_phoneController.text}');
                  //     Navigator.of(context).pop();
                  //   },
                  //   child: Text('Submit'),
                  // ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          // submit();
                        }
                      },
                      style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all(
                            AppColors.greenColor,
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            AppColors.greenColor,
                          ),
                          overlayColor: WidgetStateColor.resolveWith(
                              (states) => Colors.white.withOpacity(0.1)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side: const BorderSide(
                                color: AppColors.greenColor,
                              )))),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        color: Colors.transparent,
                        child: Container(
                          height: 35,
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            // color: AppColors.kPrimary,
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
