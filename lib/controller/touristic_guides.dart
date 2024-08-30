import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/touristic_guide.dart';

class TouristicGuidesController extends GetxController {
  final List<TouristicGuideModel> touristics = [
    // HouseModel(
    //   imageUrl: ['assets/images/house1.png'],
    //   id: '3',
    //   wilaya: 'oran',
    //   adress: 'AI TURk',
    //   phone: '+21343',
    //   link: '',
    //   location: '',
    //   description: '',
    // ),

    // Add more houses here
  ];
  Future<void> getAllTouristicsGuide() async {
    FirebaseFirestore.instance
        .collection("touristGuides")
        .snapshots(includeMetadataChanges: true)
        .listen((value) async {
      touristics.clear(); // Clear the list to prevent duplicates

      for (var doc in value.docs) {
        TouristicGuideModel touristAgencyModel = TouristicGuideModel(
          id: doc["touristGuideId"],
          adress: doc["touristGuideAdress"],
          image: doc["touristGuideIcon"],
          phone: doc["touristGuidePhone"],
          description: doc["touristGuideDescription"],
          email: doc["touristGuideEmail"],
          name: doc["touristGuideName"],
          languages: doc["touristGuideLanguages"],
        );

        // Add the agency to the list
        touristics.add(touristAgencyModel);
      }
      update(); // Notify listeners about the update
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllTouristicsGuide();
    super.onInit();
  }
}
