import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/tourist_agency.dart';
import '../../model/tourist_agency.dart';
import '../../theme/main_colors.dart';
import 'agency_details.dart';

class TouristAgenciesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TouristAgenciesController touristAgenciesController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: const Text('الوكالات السياحية'),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        bottom: PreferredSize(
            preferredSize: const Size(0, 0),
            child: Container(
              color: AppColors.blackColor,
              height: 1,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GetBuilder<TouristAgenciesController>(
          builder: (contx) => ListView.builder(
            itemCount: touristAgenciesController.agencies.length,
            itemBuilder: (context, index) {
              final agency = touristAgenciesController.agencies[index];
              return AgencyCard(agency: agency);
            },
          ),
        ),
      ),
    );
  }
}

class AgencyCard extends StatelessWidget {
  final TouristAgencyModel agency;

  const AgencyCard({required this.agency});

  @override
  Widget build(BuildContext context) {
    TouristAgenciesController touristAgenciesController = Get.find();
    return GestureDetector(
      onTap: () {
        // Get.to(() => AgencyDetailsPage(agency: agency));
        Get.toNamed("/AgencyDetailsPage", arguments: agency);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => AgencyDetailsPage(agency: agency)),
        // );
        print("object");
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                agency.imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    agency.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    agency.wilaya,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    agency.location,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
