// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../theme/main_colors.dart';

// class ForgotPasswordController extends GetxController {
//   final emailFormKey = GlobalKey<FormState>();
//   final passwordFormKey = GlobalKey<FormState>();
//   final codePINFormKey = GlobalKey<FormState>();
//   bool someError = false;

//   PageController pageController = PageController(keepPage: true);
//   bool securedPassword = true;

//   String? newPassword;
//   inputnewPassword(String inputNewPassword) {
//     newPassword = inputNewPassword;
//   }

//   String? fgpEmail;
//   inputfgbEmail(String inputEmail) {
//     fgpEmail = inputEmail.trim();
//     someError = false;
//     update();
//   }

//   String? codePIN;
//   inputCodePIN(String inputCodePIN) {
//     if (inputCodePIN.length < 7) {
//       codePIN = inputCodePIN;
//     }
//   }

//   sendEmail() async {
//     Get.defaultDialog(
//         barrierDismissible: false,
//         title: "Veuillez patienter...",
//         content: const CircularProgressIndicator(
//           color: AppColors.kPrimary2,
//         ));

//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: fgpEmail!);
//       Get.back();

//       pageController.animateToPage(1,
//           duration: const Duration(milliseconds: 250), curve: Curves.ease);
//     } on FirebaseAuthException catch (e) {
//       Get.back();

//       if (e.code == 'user-not-found') {
//         someError = true;

//         Get.defaultDialog(
//           title: "Utilisateur non trouvé",
//           content: const Icon(
//             Icons.report_problem,
//             color: Colors.red,
//           ),
//           onConfirm: () {
//             Get.back();
//           },
//         );
//       } else {
//         Get.defaultDialog(
//           title:"Il y a une erreur",
//           content: const Icon(
//             Icons.report_problem,
//             color: Colors.red,
//           ),
//           onConfirm: () {
//             Get.back();
//           },
//         );
//       }
//     }
//   }

//   changeEmail() {
//     fgpEmail = "";
//     newPassword = "";

//     pageController.animateToPage(0,
//         duration: const Duration(milliseconds: 250), curve: Curves.ease);
//   }

//   invertSecuredPassword() {
//     securedPassword = !securedPassword;
//     update();
//   }

//   @override
//   void onClose() {
//     pageController.dispose();
//     super.onClose();
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/main_colors.dart';

class ForgotPasswordController extends GetxController {
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final codePINFormKey = GlobalKey<FormState>();
  bool someError = false;

  PageController pageController = PageController(keepPage: true);
  bool securedPassword = true;

  String? newPassword;
  inputnewPassword(String inputNewPassword) {
    newPassword = inputNewPassword;
  }

  String? fgpEmail;
  inputfgbEmail(String inputEmail) {
    fgpEmail = inputEmail.trim();
    someError = false;
    update();
  }

  String? codePIN;
  inputCodePIN(String inputCodePIN) {
    if (inputCodePIN.length < 7) {
      codePIN = inputCodePIN;
    }
  }

  sendEmail() async {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "يرجى الانتظار...",
        content: const CircularProgressIndicator(
          color: AppColors.kPrimary2,
        ));

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: fgpEmail!);
      Get.back();

      pageController.animateToPage(1,
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
    } on FirebaseAuthException catch (e) {
      Get.back();

      if (e.code == 'user-not-found') {
        someError = true;

        Get.defaultDialog(
          title: "المستخدم غير موجود",
          content: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      } else {
        Get.defaultDialog(
          title: "حدث خطأ",
          content: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      }
    }
  }

  changeEmail() {
    fgpEmail = "";
    newPassword = "";

    pageController.animateToPage(0,
        duration: const Duration(milliseconds: 250), curve: Curves.ease);
  }

  invertSecuredPassword() {
    securedPassword = !securedPassword;
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

