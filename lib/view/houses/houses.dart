// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/controller/houses.dart';
// import 'package:flutter_application_1/model/house.dart';
// import 'package:get/get.dart';

// import '../../theme/main_colors.dart';

// class HouseListPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     HousesController housesController = Get.find();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.greenColor,
//         title: Text('Houses'.tr,
//             style: const TextStyle(color: AppColors.whiteColor)),
//         leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios_new_outlined,
//               color: Colors.white,
//             )),

//         actions: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: IconButton(
//                 onPressed: () {
//                   Get.toNamed('/SearchHotelsPage');
//                 },
//                 icon: const Icon(
//                   Icons.search,
//                   color: Colors.white,
//                   size: 30,
//                 )),
//           ),
//         ],
//           bottom: TabBar(
//             tabs: [
//               Tab(text: "Tourist Agencies".tr),
//               Tab(text: "Electronic visa".tr),
//             ],
//             indicatorColor: AppColors.whiteColor,
//             labelColor: AppColors.whiteColor,
//           ),
//       ),
//       backgroundColor: Colors.white,
//       body:
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GetBuilder<HousesController>(
//           builder: (contx) => GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 3 / 4,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//             ),
//             itemCount: housesController.houses.length,
//             itemBuilder: (context, index) {
//               final house = housesController.houses[index];
//               return HouseCard(house: house);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// //
// class HouseCard extends StatelessWidget {
//   final HouseModel house;

//   const HouseCard({required this.house});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Get.toNamed("/HouseDetails", arguments: house);
//       },
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ClipRRect(
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(15)),
//                 child: Image.network(
//                   house.imageUrl[0],
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GetBuilder<HousesController>(
//                     builder: (contx) {
//                       if (house.type == "فندق") {
//                         return Text(
//                           house.name!,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         );
//                       }
//                       return Text(
//                         house.wilaya!,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       );
//                     },
//                   ),
//                   // SizedBox(height: 4),
//                   // Text(
//                   //   house.location,
//                   //   style: TextStyle(
//                   //     color: Colors.grey,
//                   //   ),
//                   // ),
//                   // SizedBox(height: 8),
//                   Text(
//                     house.adress!,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   //

//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     _buildFeatureIcon(Icons.king_bed, house.bedrooms),
//                   //     _buildFeatureIcon(Icons.bathtub, house.bathrooms),
//                   //     _buildFeatureIcon(
//                   //         Icons.directions_car, house.parkingSpaces),
//                   //   ],
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFeatureIcon(IconData icon, int count) {
//     return Row(
//       children: [
//         Icon(icon, size: 16, color: Colors.grey),
//         const SizedBox(width: 4),
//         Text('$count', style: const TextStyle(color: Colors.grey)),
//       ],
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/houses.dart';
import '../../model/house.dart';
import '../../theme/main_colors.dart';

class HouseListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.greenColor,
          title: Text('Houses'.tr,
              style: const TextStyle(color: AppColors.whiteColor)),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                onPressed: () {
                  Get.toNamed('/SearchHotelsPage');
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: "Hotels".tr),
              Tab(text: "Houses".tr),
            ],
            indicatorColor: AppColors.whiteColor,
            labelColor: AppColors.whiteColor,
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            HouseGridView(houseType: "فندق"),
            HouseGridView(houseType: "منزل"),
          ],
        ),
      ),
    );
  }
}

class HouseGridView extends StatelessWidget {
  final String houseType;

  const HouseGridView({Key? key, required this.houseType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HousesController>(
      builder: (controller) {
        // Debug print
        print('Total houses: ${controller.houses.length}');
        print('Houses of type $houseType: ${controller.houses.where((house) => house.type == houseType).length}');
        
        final filteredHouses = controller.houses.where((house) => house.type == houseType).toList();
        
        if (filteredHouses.isEmpty) {
          return Center(child: Text('No $houseType found'));
        }
        
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: filteredHouses.length,
            itemBuilder: (context, index) {
              final house = filteredHouses[index];
              return HouseCard(house: house);
            },
          ),
        );
      },
    );
  }
}

class HouseCard extends StatelessWidget {
  final HouseModel house;

  const HouseCard({required this.house});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/HouseDetails", arguments: house);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  house.imageUrl[0],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: $error');
                    return Container(
                      color: Colors.grey,
                      child: Center(child: Text('Image not available')),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    house.type == "فندق" ? house.name! : house.wilaya!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    house.adress!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}