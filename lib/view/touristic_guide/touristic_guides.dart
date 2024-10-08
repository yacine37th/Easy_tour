import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/touristic_guide.dart';
import 'package:get/get.dart';

import '../../controller/touristic_guides.dart';
import '../../theme/main_colors.dart';

class TouristicGuides extends StatelessWidget {
  const TouristicGuides({super.key});

  @override
  Widget build(BuildContext context) {
    TouristicGuidesController touristicGuidesController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        title: Text('Touristic guide'.tr,
            style: const TextStyle(color: AppColors.whiteColor)),
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
        child: GetBuilder<TouristicGuidesController>(
          builder: (contx) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: touristicGuidesController.touristics.length,
            itemBuilder: (context, index) {
              final touristicGuide =
                  touristicGuidesController.touristics[index];
              return HouseCard(touristicGuide: touristicGuide);
            },
          ),
        ),
      ),
    );
  }
}

class HouseCard extends StatelessWidget {
  final TouristicGuideModel touristicGuide;

  const HouseCard({required this.touristicGuide});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/TouristicGuideDetails", arguments: touristicGuide);
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  touristicGuide.image,
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
                    touristicGuide.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    touristicGuide.adress,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
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
        SizedBox(width: 4),
        Text('$count', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
