import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/house.dart';

class HousesController extends GetxController {
  final List<HouseModel> houses = [];
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
          stars: doc["houseStars"],
          type: doc["houseType"],
          name: doc["houseName"],
        );

        // Add the agency to the list
        houses.add(touristAgencyModel);
      }
      print("houses.length//////////////");
      print(houses.length);
      update(); // Notify listeners about the update
    });
    houses.forEach(
      (element) {
        print(element.id);
        print(element.id);
      },
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllHouses();
    super.onInit();
  }
}
