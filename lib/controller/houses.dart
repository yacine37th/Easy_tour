import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/house.dart';

class HousesController extends GetxController {
  final List<HouseModel> houses = [
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
        .collection("houses")
        .snapshots(includeMetadataChanges: true)
        .listen((value) async {
      houses.clear(); // Clear the list to prevent duplicates

      for (var doc in value.docs) {
        HouseModel touristAgencyModel = HouseModel(
          id: doc["houseId"],
          adress: doc["houseAdress"],
          imageUrl: doc["housePictures"],
          phone: doc["housePhone"],
          location: doc["housePosition"],
          link: doc["houseLink"],
          wilaya: doc["houseWilaya"],
          description: doc["houseDescription"],
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
