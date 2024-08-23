// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/theme/main_colors.dart';
// import 'package:get/get.dart';

// class SignUpController extends GetxController {
//   final formKey = GlobalKey<FormState>();
//   bool showPassword = true;

//   String? userName;
//   String? userEmailAddress;

//   String? userPassword;
//   var selectedValue;

//     List<String> wilayas = [
//     'أدرار',
//     'الشلف',
//     "الأغواط",
//     "أم البواقي",
//     "باتنة",
//     "بجاية",
//     "بسكرة",
//     "بشار",
//     "البليدة",
//     "البويرة",
//     "تمنراست",
//     "تبسة",
//     "تلمسان",
//     "تيارت",
//     "تيزي وزو",
//     "الجزائر",
//     "الجلفة",
//     "جيجل",
//     "سطيف",
//     "سعيدة",
//     "سكيكدة",
//     "سيدي بلعباس ",
//     "عنابة",
//     "قالمة",
//     "قسنطينة",
//     "المدية",
//     "مستغانم",
//     "المسيلة",
//     "معسكر",
//     "ورقلة",
//     "وهران",
//     "البيض",
//     "إليزي",
//     "برج بوعريريج",
//     "بومرداس",
//     "الطارف",
//     "تيسمسيلت",
//     "الوادي",
//     "خنشلة",
//     "سوق أهراس",
//     "تيبازة",
//     "ميلة",
//     "عين الدفلة",
//     "النعامة",
//     "عين تيموشنت",
//     "غرداية",
//     "غليزان"
//   ]; // Option 2
//   // var _selectedLocation;

//   invertShowPassword() {
//     showPassword = !showPassword;
//     update();
//   }

//   createNewUser() async {
//     Get.defaultDialog(
//         barrierDismissible: false,
//         title: "Veuillez patienter...",
//         content: const CircularProgressIndicator(
//           color: AppColors.kPrimary2,
//         ));
//     try {
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: userEmailAddress!,
//         password: userPassword!,
//       );

//       FirebaseFirestore.instance
//           .collection("users")
//           .doc(credential.user!.uid)
//           .set({
//         "userID": credential.user!.uid,
//         "userEmail": userEmailAddress,
//         "userName": userName,
//         "userType": selectedValue
//       });
//       await FirebaseAuth.instance.currentUser?.sendEmailVerification();
//       Get.back();
//       Get.toNamed("/EmailVerification");
//     } on FirebaseAuthException catch (e) {
//       Get.back();
//       if (e.code == 'weak-password') {
//         Get.defaultDialog(
//           title: "Le mot de passe est faible, veuillez le changer",
//           content: const Icon(
//             Icons.report_problem,
//             color: Colors.red,
//           ),
//           onConfirm: () {
//             Get.back();
//           },
//         );
//       } else if (e.code == 'email-already-in-use') {
//         Get.defaultDialog(
//           title: "Un compte utilise déjà cette adresse e-mail",
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/main_colors.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool showPassword = true;

  String? userName;
  String? userEmailAddress;

  String? userPassword;
  var selectedValue;

  List<String> wilayas = [
    'أدرار',
    'الشلف',
    "الأغواط",
    "أم البواقي",
    "باتنة",
    "بجاية",
    "بسكرة",
    "بشار",
    "البليدة",
    "البويرة",
    "تمنراست",
    "تبسة",
    "تلمسان",
    "تيارت",
    "تيزي وزو",
    "الجزائر",
    "الجلفة",
    "جيجل",
    "سطيف",
    "سعيدة",
    "سكيكدة",
    "سيدي بلعباس",
    "عنابة",
    "قالمة",
    "قسنطينة",
    "المدية",
    "مستغانم",
    "المسيلة",
    "معسكر",
    "ورقلة",
    "وهران",
    "البيض",
    "إليزي",
    "برج بوعريريج",
    "بومرداس",
    "الطارف",
    "تيسمسيلت",
    "الوادي",
    "خنشلة",
    "سوق أهراس",
    "تيبازة",
    "ميلة",
    "عين الدفلة",
    "النعامة",
    "عين تيموشنت",
    "غرداية",
    "غليزان"
  ]; // Option 2

  invertShowPassword() {
    showPassword = !showPassword;
    update();
  }

  createNewUser() async {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "يرجى الانتظار...",
        content: const CircularProgressIndicator(
          color: AppColors.kPrimary2,
        ));
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmailAddress!,
        password: userPassword!,
      );

      FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user!.uid)
          .set({
        "userID": credential.user!.uid,
        "userEmail": userEmailAddress,
        "userName": userName,
      });
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      Get.back();
      Get.toNamed("/EmailVerification");
    } on FirebaseAuthException catch (e) {
      Get.back();
      if (e.code == 'weak-password') {
        Get.defaultDialog(
          title: "كلمة المرور ضعيفة، يرجى تغييرها",
          content: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
          title: "حساب يستخدم بالفعل عنوان البريد الإلكتروني هذا",
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
