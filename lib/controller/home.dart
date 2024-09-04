import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../model/event.dart';
import '../model/publicity.dart';
import '../theme/main_colors.dart';

class HomeController extends GetxController {
  final List<EventModel> flutterTopicsList = [
    EventModel(
      id: "0",
      topicIcon: "assets/images/houses.png",
      topicName: "كراء المنازل",
      link: '/Houses',
      conditions: '',
    ),
    EventModel(
      id: "1",
      topicIcon: "assets/images/businessman.png",
      topicName: "الوكالات السياحية",
      link: '/TouristAgencies',
      conditions: '',
    ),
    EventModel(
      id: "2",
      topicIcon: "assets/images/guide.png",
      topicName: "المرشد السياحي",
      link: '/TouristicGuides',
      conditions: '',
    ),
    // EventModel(
    //   id: "3",
    //   topicIcon: "assets/images/trips.png",
    //   topicName: "رحلات التخييم",
    //   link: '/Dawarat',
    //   conditions: '',
    // ),
  ];
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
    // publicities
    update();
  }
 String localeValue = MainFunctions.sharredPrefs!.getString("codeLang") ??
      Get.deviceLocale!.languageCode;

  setLanguage() {
    Get.defaultDialog(
        title: "ChangeLanguage".tr,
        content: Column(
          children: [
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      AppColors.kPrimary2,
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.kPrimary2,
                    ),
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white.withOpacity(0.1)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: const BorderSide(
                          color: AppColors.kPrimary2,
                        )))),
                onPressed: () {
                  localeValue = "fr";
                  Get.updateLocale(const Locale("fr"));
                  MainFunctions.sharredPrefs!
                      .setString("codeLang", localeValue);
                  Get.back();
                },
                child: Text(
                  "francais".tr,
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      AppColors.kPrimary2,
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.kPrimary2,
                    ),
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white.withOpacity(0.1)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: const BorderSide(
                          color: AppColors.kPrimary2,
                        )))),
                onPressed: () {
                  localeValue = "ar";
                  Get.updateLocale(const Locale("ar"));
                  MainFunctions.sharredPrefs!
                      .setString("codeLang", localeValue);
                  Get.back();
                },
                child: Text(
                  "arab".tr,
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ));

    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getCarouselPub();
    super.onInit();
  }
}
