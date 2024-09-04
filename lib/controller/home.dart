import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../functions/functions.dart';
import '../model/event.dart';
import '../model/publicity.dart';
import '../theme/main_colors.dart';

// class HomeController extends GetxController {
//   final List<EventModel> flutterTopicsList = [
//     EventModel(
//       id: "0",
//       topicIcon: "assets/images/houses.png",
//       topicName: "Renting houses".tr,
//       link: '/Houses',
//       conditions: '',
//     ),
//     EventModel(
//       id: "1",
//       topicIcon: "assets/images/businessman.png",
//       topicName: "Tourist Agencies".tr,
//       link: '/TouristAgencies',
//       conditions: '',
//     ),
//     EventModel(
//       id: "2",
//       topicIcon: "assets/images/guide.png",
//       topicName: "Touristic guide".tr,
//       link: '/TouristicGuides',
//       conditions: '',
//     ),
//   ];
//   Map<String, PublicityModel> publicities = {};
//   Future<void> getCarouselPub() async {
//     var tempIDList = {};
//     await FirebaseFirestore.instance.collection("carousel").get().then((value) {
//       for (int index = 0; index < value.docs.length; index++) {
//         String? carouselUrl;
//         if (value.docs[index].data().containsKey("carouselUrl")) {
//           carouselUrl = value.docs[index]["carouselUrl"];
//         }
//         tempIDList.addAll({
//           value.docs[index].id: [
//             value.docs[index]["carouselPicture"],
//             carouselUrl
//           ]
//         });
//         publicities.addAll({
//           value.docs[index].id: PublicityModel(
//             id: value.docs[index].id,
//             imageUrl: value.docs[index]["carouselPicture"],
//             url: value.docs[index]["carouselUrl"],
//           )
//         });
//       }
//     });
//     publicities.forEach(
//       (key, value) {
//         print(value.id);
//       },
//     );
//     // publicities
//     update();
//   }

//   String localeValue = MainFunctions.sharredPrefs!.getString("codeLang") ??
//       Get.deviceLocale!.languageCode;

//   setLanguage() {
//     Get.defaultDialog(
//         title: "ChangeLanguage".tr,
//         content: Column(
//           children: [
//             TextButton(
//                 style: ButtonStyle(
//                     foregroundColor: MaterialStateProperty.all(
//                       AppColors.kPrimary2,
//                     ),
//                     backgroundColor: MaterialStateProperty.all(
//                       AppColors.kPrimary2,
//                     ),
//                     overlayColor: MaterialStateColor.resolveWith(
//                         (states) => Colors.white.withOpacity(0.1)),
//                     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(100),
//                         side: const BorderSide(
//                           color: AppColors.kPrimary2,
//                         )))),
//                 onPressed: () {
//                   localeValue = "fr";
//                   Get.updateLocale(const Locale("fr"));
//                   Get.forceAppUpdate();
//                   Get.appUpdate();
//                   MainFunctions.sharredPrefs!
//                       .setString("codeLang", localeValue);
//                   Get.back();
//                 },
//                 child: Text(
//                   "francais".tr,
//                   style: TextStyle(color: Colors.white),
//                 )),
//             const SizedBox(
//               height: 10,
//             ),
//             TextButton(
//                 style: ButtonStyle(
//                     foregroundColor: MaterialStateProperty.all(
//                       AppColors.kPrimary2,
//                     ),
//                     backgroundColor: MaterialStateProperty.all(
//                       AppColors.kPrimary2,
//                     ),
//                     overlayColor: MaterialStateColor.resolveWith(
//                         (states) => Colors.white.withOpacity(0.1)),
//                     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(100),
//                         side: const BorderSide(
//                           color: AppColors.kPrimary2,
//                         )))),
//                 onPressed: () {
//                   localeValue = "ar";
//                   Get.updateLocale(const Locale("ar"));
//                   Get.forceAppUpdate();
//                   Get.appUpdate();
//                   MainFunctions.sharredPrefs!
//                       .setString("codeLang", localeValue);
//                   Get.back();
//                 },
//                 child: Text(
//                   "arab".tr,
//                   style: TextStyle(color: Colors.white),
//                 )),
//           ],
//         ));

//     update();
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     getCarouselPub();
//     super.onInit();
//   }
// }
class HomeController extends GetxController {
  RxList<EventModel> flutterTopicsList = <EventModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCarouselPub();
    _initializeFlutterTopicsList();
  }

  void _initializeFlutterTopicsList() {
    flutterTopicsList.value = [
      EventModel(
        id: "0",
        topicIcon: "assets/images/houses.png",
        topicName: "Renting houses".tr,
        link: '/Houses',
        conditions: '',
      ),
      EventModel(
        id: "1",
        topicIcon: "assets/images/businessman.png",
        topicName: "Tourist Agencies".tr,
        link: '/TouristAgencies',
        conditions: '',
      ),
      EventModel(
        id: "2",
        topicIcon: "assets/images/guide.png",
        topicName: "Touristic guide".tr,
        link: '/TouristicGuides',
        conditions: '',
      ),
    ];
  }

  void aboutUs() {
    Get.defaultDialog(
      title: "تعرف علينا",
      content: Column(
        children: [
          const Text(
            '''
نحن المنصة المتكاملة التي تُسهل عليك تجربة السفر والاستكشاف، نحن نؤمن بأن السفر يجب أن يكون ممتعًا وخاليًا من التعقيدات ولهذا نقدم لك كل ما تحتاجه في مكان واحد، لتحويل كل رحلة إلى تجربة مميزة من خلال توفير حلول مبتكرة وموثوقة لكل احتياجات السفر الخاصة بك من كراء منازل وحجز فنادق وغرف للمبيت وبه أيضا حجز رحلات عن طريق وكالات سياحية و الحصول على تأشيرات إلكترونية كما به مرشدين سياحيين للإكتشاف والمتعة.
انضم إلينا ودعنا نساعدك على استكشاف العالم بسهولة ويسر.
''',
          ),
          const SizedBox(
            height: 15,
          ),
          TextButton(
            style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(AppColors.greenColor),
                backgroundColor: WidgetStateProperty.all(AppColors.greenColor),
                overlayColor: WidgetStateColor.resolveWith(
                    (states) => Colors.white.withOpacity(0.1)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: const BorderSide(
                      color: AppColors.greenColor,
                    )))),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "متابعة",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  Map<String, PublicityModel> publicities = {};
  Future<void> getCarouselPub() async {
    var tempIDList = {};
    await FirebaseFirestore.instance.collection("carousel").get().then((value) {
      for (int index = 0; index < value.docs.length; index++) {
        String? carouselUrl;
        if (value.docs[index].data().containsKey("carouselUrl")) {
          carouselUrl = value.docs[index]["carouselUrl"];
        }
        tempIDList.addAll({
          value.docs[index].id: [
            value.docs[index]["carouselPicture"],
            carouselUrl
          ]
        });
        publicities.addAll({
          value.docs[index].id: PublicityModel(
            id: value.docs[index].id,
            imageUrl: value.docs[index]["carouselPicture"],
            url: value.docs[index]["carouselUrl"],
          )
        });
      }
    });
    publicities.forEach(
      (key, value) {
        print(value.id);
      },
    );
    update();
  }

  String localeValue = MainFunctions.sharredPrefs!.getString("codeLang") ??
      Get.deviceLocale!.languageCode;

  void setLanguage() {
    Get.defaultDialog(
        title: "ChangeLanguage".tr,
        content: Column(
          children: [
            _buildLanguageButton("fr", "francais"),
            const SizedBox(height: 10),
            _buildLanguageButton("ar", "arab"),
          ],
        ));
  }

  TextButton _buildLanguageButton(String langCode, String langLabel) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColors.kPrimary2),
        backgroundColor: MaterialStateProperty.all(AppColors.kPrimary2),
        overlayColor: MaterialStateColor.resolveWith(
            (states) => Colors.white.withOpacity(0.1)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: const BorderSide(color: AppColors.kPrimary2),
          ),
        ),
      ),
      onPressed: () {
        localeValue = langCode;
        Get.updateLocale(Locale(langCode));
        Get.forceAppUpdate();
        Get.appUpdate();
        MainFunctions.sharredPrefs!.setString("codeLang", localeValue);
        Get.back();
        _initializeFlutterTopicsList(); // Update the list to the new language
      },
      child: Text(
        langLabel.tr,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
