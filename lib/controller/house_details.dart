// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/functions/functions.dart';
// import 'package:flutter_application_1/main.dart';
// import 'package:flutter_application_1/model/house.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../theme/main_colors.dart';

// class HouseDetailsController extends GetxController {
//   final HouseModel house = Get.arguments;
//   final formKey = GlobalKey<FormState>();

//   void launchURL(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(uri)) {
//       throw 'Could not launch $url';
//     }
//   }

//   String? name;
//   String? phone;
//   Future<void> makeReservation() async {
//     Get.defaultDialog(
//         barrierDismissible: false,
//         title: "انتظر من فضلك",
//         content: const CircularProgressIndicator(
//           color: AppColors.kPrimary2,
//         ));

//     try {
//       var doc =
//           FirebaseFirestore.instance.collection("reservationHouses").doc();
//       doc.set({
//         "reservationHouseId": doc.id,
//         "reservationHouseUserId": currentUserInfos.uID,
//         "reservationHouseUserName": name,
//         // "reservationHouseUserEmail": currentUserInfos.email,
//         "reservationHouseHousePicture": house.imageUrl[0],
//         "reservationHousePhone": phone,
//       });
//       Get.back();
//       MainFunctions.successSnackBar("Réservation réussie");
//     } catch (e) {}
//   }

//   void showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       // backgroundColor: AppColors.gre,

//       context: context,
//       isScrollControlled:
//           true, // Allow the bottom sheet to be taller than the screen
//       builder: (BuildContext context) {
//         return Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           child: Container(
//             padding: EdgeInsets.all(16.0),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   TextFormField(
//                     textInputAction: TextInputAction.next,
//                     keyboardType: TextInputType.text,
//                     onSaved: (username) {
//                       name = username!;
//                     },
//                     onChanged: (username) {
//                       name = username.trim();
//                     },
//                     validator: (val) {
//                       if (val!.isEmpty) {
//                         return "الرجاء ادخال الاسم و اللقب";
//                       }
//                       return null;
//                     },
//                     initialValue: name,
//                     decoration: InputDecoration(
//                       hintText: "الاسم و اللقب...",
//                       errorMaxLines: 2,
//                       prefixIcon: const Icon(
//                         Icons.person,
//                         color: AppColors.greenColor,
//                         size: 25,
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 16),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: AppColors.kLine),
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       fillColor: AppColors.inputBg,
//                       filled: true,
//                       focusedBorder: OutlineInputBorder(
//                         borderSide:
//                             const BorderSide(color: AppColors.greenColor),
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: const BorderSide(color: AppColors.kLine),
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: AppColors.KError),
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       hintStyle: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w300,
//                           color: Colors.grey),
//                     ),
//                   ),
//                   SizedBox(height: 16.0),
//                   TextFormField(
//                     textInputAction: TextInputAction.next,
//                     keyboardType: TextInputType.phone,
//                     onSaved: (username) {
//                       phone = username!;
//                     },
//                     onChanged: (username) {
//                       phone = username.trim();
//                     },
//                     validator: (val) {
//                       if (val!.isEmpty) {
//                         return "الرجاء ادخال رقم الهاتف";
//                       }
//                       return null;
//                     },
//                     initialValue: phone,
//                     decoration: InputDecoration(
//                       hintText: "رقم الهاتف ...",
//                       errorMaxLines: 2,
//                       prefixIcon: const Icon(
//                         Icons.phone,
//                         color: AppColors.greenColor,
//                         size: 25,
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 16),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: AppColors.kLine),
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       fillColor: AppColors.inputBg,
//                       filled: true,
//                       focusedBorder: OutlineInputBorder(
//                         borderSide:
//                             const BorderSide(color: AppColors.greenColor),
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: const BorderSide(color: AppColors.kLine),
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: AppColors.KError),
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       hintStyle: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w300,
//                           color: Colors.grey),
//                     ),
//                   ),
//                   SizedBox(height: 16.0),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 70),
//                     child: TextButton(
//                       onPressed: () {
//                         if (formKey.currentState!.validate()) {
//                           formKey.currentState!.save();
//                           // submit();
//                           // makeReservation();
//                           Navigator.of(context).pop();
//                         }
//                       },
//                       style: ButtonStyle(
//                           foregroundColor: WidgetStateProperty.all(
//                             AppColors.greenColor,
//                           ),
//                           backgroundColor: WidgetStateProperty.all(
//                             AppColors.greenColor,
//                           ),
//                           overlayColor: WidgetStateColor.resolveWith(
//                               (states) => Colors.white.withOpacity(0.1)),
//                           shape: WidgetStateProperty.all(RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(100),
//                               side: const BorderSide(
//                                 color: AppColors.greenColor,
//                               )))),
//                       child: Card(
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                         color: Colors.transparent,
//                         child: Container(
//                           height: 35,
//                           alignment: Alignment.center,
//                           width: double.maxFinite,
//                           decoration: BoxDecoration(
//                             // color: AppColors.kPrimary,
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: const Text(
//                             "متابعة ",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 19,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../functions/functions.dart';
import '../model/house.dart';
import '../theme/main_colors.dart';

class HouseDetailsController extends GetxController {
  final HouseModel house = Get.arguments;
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

  String? name;
  String? phone;

  Future<void> makeReservation() async {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "Please wait".tr,
        content: const CircularProgressIndicator(
          color: AppColors.kPrimary2,
        ));

    try {
      var doc =
          FirebaseFirestore.instance.collection("reservationHouses").doc();
      doc.set({
        "reservationHousesId": doc.id,
        "reservationHousesUserId": currentUserInfos.uID,
        "reservationHousesUserName": name,
        "reservationHousesHousePicture": house.imageUrl[0],
        "reservationHousesPhone": phone,
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
                        return "please fill the name and family name".tr;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "name and family name".tr,
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
                      hintText: "Phone".tr,
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
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)))),
                      child: Container(
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Continue".tr,
                          style: const TextStyle(
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
