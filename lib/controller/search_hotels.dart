import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/house.dart';

class SearchHotelsController extends GetxController {
  // Reactive variables
  var professionals = <HouseModel>[].obs;
  var addedIds = <String>{}.obs;
  var inputSearch = ''.obs;
  var isFetching = false.obs;

  // Method to set the input search
  void getInputSearch(String input) {
    inputSearch.value = input;
  }

  // Method to fetch search results
  Future<void> getSearched(String? inputSearch) async {
    if (inputSearch == null || inputSearch.isEmpty) {
      return;
    }

    professionals.clear();
    addedIds.clear();

    String searchInput = inputSearch.toLowerCase();
    String searchInput2 =
        searchInput[0].toUpperCase() + searchInput.substring(1);

    isFetching.value = true;

    final List<dynamic> targetValues = [searchInput, searchInput2];

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("houses")
          .where("houseType", isEqualTo: "فندق")
          .where('houseKeyWords', arrayContainsAny: targetValues)
          .get();

      for (var doc in querySnapshot.docs) {
        String id = doc.id;
        if (!addedIds.contains(id)) {
          HouseModel product = HouseModel(
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
          professionals.add(product);
          addedIds.add(id);
        }
      }
    } finally {
      isFetching.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (inputSearch.isNotEmpty) {
      getSearched(inputSearch.value);
    }
  }
}
