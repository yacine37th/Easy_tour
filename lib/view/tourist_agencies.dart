import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/tourist_agency.dart';
import '../model/tourist_agency.dart';
import '../theme/main_colors.dart';

class TouristAgenciesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TouristAgenciesController touristAgenciesController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourist Agencies'),
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
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
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
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  agency.wilaya,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  agency.location,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
