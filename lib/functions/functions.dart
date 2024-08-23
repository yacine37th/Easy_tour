import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../model/user.dart';
import '../theme/main_colors.dart';
// import 'package:intl/intl.dart' as intl;

class MainFunctions {
  // static SharedPreferences? sharredPrefs;
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

////////exit from the application
  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform
        .invokeMethod<void>('SystemNavigator.pop', animated);
  }
}
