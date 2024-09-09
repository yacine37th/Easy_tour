import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../model/user.dart';
import '../theme/main_colors.dart';
// import 'package:intl/intl.dart' as intl;

class MainFunctions {
  static SharedPreferences? sharredPrefs;
  // static intl.DateFormat dateFormat = intl.DateFormat('yyyy-MM-dd');
  static TextDirection? textDirection = TextDirection.rtl;
  static File? pickedImage;

  static Color generatePresizedColor(int namelength) {
    return profilColors[((namelength - 3) % 8).floor()];
  }

  static getcurrentUserInfos() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .get()
        .then(
      (value) async {
        currentUserInfos = UserModel(
          uID: value["userID"],
          email: value["userEmail"],
          name: value["userName"],
          // wilaya: value["userWilaya"],
          // type: value["userType"],
          // commune: value["userCommune"],
        );
      },
    );
  }

  static waitingBar(String text, Color? color) {
    Get.defaultDialog(
        title: text,
        content: const CircularProgressIndicator(
          color: AppColors.kSecondary,
        ));
  }

  static successSnackBar(String text) {
    if (!Get.isSnackbarOpen) {
      Get.rawSnackbar(
          isDismissible: true,
          duration: const Duration(seconds: 3),
          messageText: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 98, 216, 102),
          showProgressIndicator: true,
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(
            Icons.done,
            color: Colors.white,
          ));
    }
  }

  static somethingWentWrongSnackBar([String? errorText]) {
    if (!Get.isSnackbarOpen) {
      Get.rawSnackbar(
          duration: const Duration(seconds: 5),
          messageText: Text(
            errorText ?? "هناك خطأ ما",
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          showProgressIndicator: true,
          snackPosition: SnackPosition.TOP,
          icon: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ));
    }
  }

  static signOutUser() async {
    await FirebaseAuth.instance.signOut().then((value) {
      currentUser = null;
      currentUserInfos = UserModel(uID: "", email: "", name: '');
      Get.offAndToNamed("/SignIn");
    });
  }

  static void showBottomSheet(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController nameController,
    TextEditingController phoneController,
    String? name,
    String? phone,
    Future onPressed,
  ) {
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
                          // makeReservation();
                          Navigator.of(context).pop();
                        }
                        onPressed;
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

////////exit from the application
  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform
        .invokeMethod<void>('SystemNavigator.pop', animated);
  }
}
