// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// import '../model/tourist_agency.dart';

// class TouristAgenciesController extends GetxController {
//   final List<TouristAgencyModel> agencies = [
//     // {
//     //   'name': 'Wanderlust Travels',
//     //   'location': 'Paris, France',
//     //   'image': 'assets/images/agency3.png',
//     //   'rating': '4.5',
//     // },
//     // {
//     //   'name': 'Sunshine Getaways',
//     //   'location': 'Maldives',
//     //   'image': 'assets/images/agency3.png',
//     //   'rating': '4.8',
//     // },
//     // {
//     //   'name': 'Adventure Time',
//     //   'location': 'Cape Town, South Africa',
//     //   'image': 'assets/images/agency3.png',
//     //   'rating': '4.7',
//     // },
//     // TouristAgencyModel(
//     //   name: 'Wanderlust Travels',
//     //   location: 'Paris, France',
//     //   imageUrl: 'assets/images/agency3.png',
//     //   rating: '4.5',
//     //   phone: '+33 1 23 45 67 89',
//     //   position: '48.8566,2.3522',
//     //   website: 'https://wanderlusttravels.com',
//     // ),
//     // TouristAgencyModel(
//     //   name: 'Sunshine Getaways',
//     //   location: 'Maldives',
//     //   imageUrl: 'assets/images/agency3.png',
//     //   rating: '4.8',
//     //   phone: '+960 123 4567',
//     //   position: '3.2028,73.2207',
//     //   website: 'https://sunshinegetaways.com',
//     // ),
//     // TouristAgencyModel(
//     //   name: 'Adventure Time',
//     //   location: 'Cape Town, South Africa',
//     //   imageUrl: 'assets/images/agency3.png',
//     //   rating: '4.7',
//     //   phone: '+27 21 123 4567',
//     //   position: '-33.9249,18.4241',
//     //   website: 'https://adventuretime.com',
//     // ),
//   ];
//   Future<void> getAllAgencies() async {
//     await FirebaseFirestore.instance
//         .collection("touristAgencies")
//         .snapshots(includeMetadataChanges: true)
//         .listen((value) async {
//       for (int index = 0; index < value.docs.length; index++) {
//         TouristAgencyModel touristAgencyModel = TouristAgencyModel(
//           name: value.docs[index]["touristAgencyName"],
//           location: value.docs[index]["touristAgencyAdress"],
//           imageUrl: value.docs[index]["touristAgencyIcon"],
//           rating: "",
//           phone: value.docs[index]["touristAgencyPhone"],
//           position: value.docs[index]["touristAgencyLocationMap"],
//           website: value.docs[index]["touristAgencyLink"],
//         );
//         if (!agencies.contains(touristAgencyModel)) {
//           agencies.add(TouristAgencyModel(
//             name: value.docs[index]["touristAgencyName"],
//             location: value.docs[index]["touristAgencyAdress"],
//             imageUrl: value.docs[index]["touristAgencyIcon"],
//             rating: "",
//             phone: value.docs[index]["touristAgencyPhone"],
//             position: value.docs[index]["touristAgencyLocationMap"],
//             website: value.docs[index]["touristAgencyLink"],
//           ));
//         }
//         update();
//       }
//     });
//     Get.forceAppUpdate();
//     // update();
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     getAllAgencies();
//     super.onInit();
//   }
// // }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// import '../model/tourist_agency.dart';

// class TouristAgenciesController extends GetxController {
//   final List<TouristAgencyModel> agencies = [];

//   Future<void> getAllAgencies() async {
//     FirebaseFirestore.instance
//         .collection("touristAgencies")
//         .snapshots(includeMetadataChanges: true)
//         .listen((value) async {
//       for (var doc in value.docs) {
//         TouristAgencyModel touristAgencyModel = TouristAgencyModel(
//           name: doc["touristAgencyName"],
//           location: doc["touristAgencyAdress"],
//           imageUrl: doc["touristAgencyIcon"],
//           rating: "", // Assuming you will update rating later
//           phone: doc["touristAgencyPhone"],
//           position: doc["touristAgencyLocationMap"],
//           website: doc["touristAgencyLink"],
//         );

//         // Avoid duplicates
//         if (!agencies.contains(touristAgencyModel)) {
//           agencies.add(touristAgencyModel);
//         }
//       }
//       agencies.forEach((element) => print(element.name));
//       update();
//     });
//     agencies.forEach((element) => print(element.name));
//   }

//   @override
//   void onInit() {
//     getAllAgencies();
//     super.onInit();
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/tourist_agency.dart';
import '../theme/main_colors.dart';

class TouristAgenciesController extends GetxController {
  final List<TouristAgencyModel> agencies = [];

  Future<void> getAllAgencies() async {
    FirebaseFirestore.instance
        .collection("touristAgencies")
        .snapshots(includeMetadataChanges: true)
        .listen((value) async {
      agencies.clear(); // Clear the list to prevent duplicates

      for (var doc in value.docs) {
        TouristAgencyModel touristAgencyModel = TouristAgencyModel(
            id: doc["touristAgencyId"],
            name: doc["touristAgencyName"],
            location: doc["touristAgencyAdress"],
            imageUrl: doc["touristAgencyIcon"],
            rating: "", // Assuming you will update rating later
            phone: doc["touristAgencyPhone"],
            position: doc["touristAgencyLocationMap"],
            website: doc["touristAgencyLink"],
            wilaya: doc["touristAgencyWilaya"],
            type: doc["touristAgencyType"]);

        // Add the agency to the list
        agencies.add(touristAgencyModel);
      }

      update(); // Notify listeners about the update
    });
  }

  Future<void> deletePost(TouristAgencyModel agency2) async {
    var doc = await FirebaseFirestore.instance
        .collection("touristAgencies")
        .doc(agency2.id);

    Get.defaultDialog(
      title: 'تاكيد',
      middleText: 'هل أنت متأكد أنك تريد حذف هذه المنتج ?',
      textConfirm: 'نعم',
      textCancel: 'لا',
      confirmTextColor: Colors.white,
      buttonColor: AppColors.kPrimary2,
      onConfirm: () {
        print('Élément supprimé');
        agencies.removeWhere((agency) => agency.id == agency2.id);
        update();
        // doc.delete();
        Get.back();
      },
      onCancel: () {
        print('Suppression annulée');
      },
    );
    // var doc = await FirebaseFirestore.instance.collection("cars").doc(id);
    // Get.defaultDialog(
    //   title: 'Confirm',
    //   middleText: 'Are you sure you want to delete this post ?'.tr,
    //   textConfirm: 'Yes',
    //   textCancel: 'No',
    //   confirmTextColor: Colors.white,
    //   buttonColor: AppColors
    //       .kPrimary2, // This line changes the confirm button color to red

    //   onConfirm: () {
    //     print('Item deleted');
    //     cars.removeWhere((key, value) => value.id == id);
    //     update();
    //     doc.delete();
    //     Get.back();
    //   },
    //   onCancel: () {
    //     print('Deletion cancelled');
    //   },
    // );
  }

  @override
  void onInit() {
    getAllAgencies();
    super.onInit();
  }
}
