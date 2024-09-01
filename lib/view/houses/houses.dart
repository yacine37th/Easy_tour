import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/houses.dart';
import 'package:flutter_application_1/model/house.dart';
import 'package:get/get.dart';

import '../../theme/main_colors.dart';

class HouseListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HousesController housesController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        title: const Text('المنازل',
            style: TextStyle(color: AppColors.whiteColor)),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
        bottom: PreferredSize(
            preferredSize: const Size(0, 0),
            child: Container(
              color: AppColors.whiteColor,
              height: 1,
            )),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<HousesController>(
          builder: (contx) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: housesController.houses.length,
            itemBuilder: (context, index) {
              final house = housesController.houses[index];
              return HouseCard(house: house);
            },
          ),
        ),
      ),
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
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  house.imageUrl[0],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    house.wilaya!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: 4),
                  // Text(
                  //   house.location,
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  // SizedBox(height: 8),
                  Text(
                    house.adress!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  //

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     _buildFeatureIcon(Icons.king_bed, house.bedrooms),
                  //     _buildFeatureIcon(Icons.bathtub, house.bathrooms),
                  //     _buildFeatureIcon(
                  //         Icons.directions_car, house.parkingSpaces),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, int count) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text('$count', style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
