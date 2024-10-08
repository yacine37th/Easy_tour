// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../functions/functions.dart';
// import '../main.dart';
// import '../theme/main_colors.dart';

// class SignInController extends GetxController {
//   final formKey = GlobalKey<FormState>();
//   bool showPassword = true;

//   String? userEmailAddress;
//   String? userPassword;

//   invertShowPassword() {
//     showPassword = !showPassword;
//     update();
//   }

//   signInAUser() async {
//     Get.defaultDialog(
//         barrierDismissible: false,
//         title: "Veuillez patienter...",
//         content: const CircularProgressIndicator(
//           color: AppColors.kPrimary2,
//         ));
//     try {
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: userEmailAddress!, password: userPassword!);

//       currentUser = FirebaseAuth.instance.currentUser;
//       await MainFunctions.getcurrentUserInfos();
//       Get.back();
//       if (credential.user!.emailVerified) {
//         // switch (currentUserInfos.type) {
//         //   case "Agence de location":
//         //     Get.offAndToNamed("/Home");
//         //   default:
//         //     Get.offAndToNamed("/HomeScreenClient");
//         // }
//         Get.offAndToNamed("/Home");
//       } else {
//         Get.toNamed("/EmailVerification");
//       }
//     } on FirebaseAuthException catch (e) {
//       Get.back();

//       if (e.code == 'user-not-found') {
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
//       } else if (e.code == 'wrong-password') {
//         Get.defaultDialog(
//           title: "Veuillez vérifier le mot de passe",
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
//           title: "Il y a une erreur",
//           content: const Icon(
//             Icons.report_problem,
//             color: Colors.red,
//           ),
//           onConfirm: () {
//             Get.back();
//           },
//         );
//       }
//     } catch (e) {
//       print("e***************");
//       print(e);
//       Get.back();
//       Get.defaultDialog(
//         title: "Il y a une erreur",
//         content: const Icon(
//           Icons.report_problem,
//           color: Colors.red,
//         ),
//         onConfirm: () {
//           Get.back();
//         },
//       );
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../main.dart';
import '../theme/main_colors.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool showPassword = true;

  String? userEmailAddress;
  String? userPassword;

  invertShowPassword() {
    showPassword = !showPassword;
    update();
  }

  signInAUser() async {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "Please wait".tr,
        content: const CircularProgressIndicator(
          color: AppColors.kPrimary2,
        ));
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmailAddress!, password: userPassword!);

      currentUser = FirebaseAuth.instance.currentUser;
      await MainFunctions.getcurrentUserInfos();
      Get.back();
      if (credential.user!.emailVerified) {
        // switch (currentUserInfos.type) {
        //   case "Student":
        //     Get.offAndToNamed("/HomeStudent");
        //   default:
        Get.offAndToNamed("/Home");
        // }
      } else {
        await FirebaseAuth.instance.currentUser?.sendEmailVerification();
        Get.toNamed("/EmailVerification");
      }
    } on FirebaseAuthException catch (e) {
      Get.back();

      if (e.code == 'user-not-found') {
        Get.defaultDialog(
          title: "User not found".tr,
          content: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: "wrong-password".tr,
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
    } catch (e) {
      print("e***************");
      print(e);
      Get.back();
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
