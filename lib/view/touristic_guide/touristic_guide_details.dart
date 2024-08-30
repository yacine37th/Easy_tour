import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/touristic_guide_details.dart';
import '../../theme/main_colors.dart';

class TouristicGuideDetails extends StatelessWidget {
  const TouristicGuideDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TouristicGuideDetailsController touristicGuideDetailsController =
        Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(touristicGuideDetailsController.touristicGuideModel.name,
            style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
            preferredSize: const Size(0, 0),
            child: Container(
              color: AppColors.blackColor,
              height: 1,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  touristicGuideDetailsController.touristicGuideModel.image,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              _buildInfoCard(
                icon: Icons.person,
                title: 'الاسم و اللقب',
                subtitle:
                    touristicGuideDetailsController.touristicGuideModel.name,
                onPressed: () => {},
              ),
              const SizedBox(height: 20),
              _buildInfoCard(
                icon: Icons.email,
                title: 'الايميل',
                subtitle:
                    touristicGuideDetailsController.touristicGuideModel.email,
                onPressed: () => touristicGuideDetailsController.launchURL(
                  'mailto:${touristicGuideDetailsController.touristicGuideModel.email}',
                ),
              ),
              const SizedBox(height: 20),
              _buildInfoCard(
                icon: Icons.location_city,
                title: 'المكان',
                subtitle:
                    touristicGuideDetailsController.touristicGuideModel.adress,
                onPressed: () => {},
              ),
              const SizedBox(height: 20),
              _buildInfoCard(
                icon: Icons.language_sharp,
                title: 'اللغات',
                subtitle: touristicGuideDetailsController
                    .touristicGuideModel.languages,
                onPressed: () => {},
              ),
              const SizedBox(height: 20),
              _buildInfoCard(
                icon: Icons.phone,
                title: 'رقم الهاتف',
                subtitle:
                    touristicGuideDetailsController.touristicGuideModel.phone,
                onPressed: () => touristicGuideDetailsController.launchURL(
                    'tel:${touristicGuideDetailsController.touristicGuideModel.phone}'),
              ),
              const SizedBox(height: 20),
              _buildInfoCard(
                  icon: Icons.language,
                  title: "وصف",
                  subtitle: touristicGuideDetailsController
                      .touristicGuideModel.description,
                  onPressed: () {}),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            backgroundColor: AppColors.greenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          onPressed: () {
            // agencyDetailsController.order();
          },
          child: const Text(
            "حجز",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      {required IconData icon,
      required String title,
      required String subtitle,
      required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Icon(icon, color: AppColors.greenColor),
          title:
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }

  Widget _buildActionButton(
      {required IconData icon,
      required String label,
      required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          backgroundColor: AppColors.greenColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
