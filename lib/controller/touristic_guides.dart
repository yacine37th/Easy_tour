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
  Future<void> getAllHouses() async {
    FirebaseFirestore.instance
        .collection("touristGuides")
        .snapshots(includeMetadataChanges: true)
        .listen((value) async {
      touristics.clear(); // Clear the list to prevent duplicates

      for (var doc in value.docs) {
        TouristicGuideModel touristAgencyModel = TouristicGuideModel(
          id: doc["touristGuideId"],
          adress: doc["touristGuideAdress"],
          imageUrl: doc["touristGuidePictures"],
          phone: doc["touristGuidePhone"],
          location: doc["touristGuidePosition"],
          link: doc["touristGuideLink"],
          wilaya: doc["touristGuideWilaya"],
          description: doc["touristGuideDescription"],
        );

        // Add the agency to the list
        houses.add(touristAgencyModel);
      }
      update(); // Notify listeners about the update
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllHouses();
    super.onInit();
  }
}
