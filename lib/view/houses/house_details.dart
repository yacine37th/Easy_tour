import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/house_details.dart';
import 'package:flutter_application_1/functions/functions.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';

import '../../theme/main_colors.dart';

class HouseDetails extends StatelessWidget {
  const HouseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    HouseDetailsController houseDetailsController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GetBuilder<HouseDetailsController>(
          builder: (contx) {
            if (houseDetailsController.house.type == "فندق") {
              return Text(houseDetailsController.house.name!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white));
            }
            return const SizedBox();
          },
        ),
        backgroundColor: AppColors.greenColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
            preferredSize: const Size(0, 0),
            child: Container(
              color: AppColors.whiteColor,
              height: 1,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(10),
              //   child: Image.asset(
              //     houseDetailsController.house.imageUrl[0],
              //     height: 200,
              //     width: double.infinity,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Container(
                // margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FlutterCarousel(
                  options: CarouselOptions(
                      height: 400.0,
                      showIndicator: true,
                      slideIndicator: const CircularSlideIndicator(
                          slideIndicatorOptions: SlideIndicatorOptions(
                        indicatorRadius: 4,
                        itemSpacing: 10,
                        indicatorBackgroundColor: Colors.grey,
                        currentIndicatorColor: Colors.white,
                      ))),
                  items: houseDetailsController.house.imageUrl.map((url) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.network(
                            url,
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),
              GetBuilder<HouseDetailsController>(builder: (context) {
                if (houseDetailsController.house.type == "فندق") {
                  return Column(
                    children: [
                      _buildInfoCard(
                        icon: Icons.hotel_rounded,
                        title: "Hotel Name".tr,
                        subtitle: houseDetailsController.house.name!,
                        onPressed: () => houseDetailsController
                            .launchURL(houseDetailsController.house.link!),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                }
                return const SizedBox();
              }),
              _buildInfoCard(
                icon: Icons.location_on,
                title: '${houseDetailsController.house.wilaya},',
                subtitle: houseDetailsController.house.adress!,
                onPressed: () => houseDetailsController
                    .launchURL(houseDetailsController.house.location!),
              ),
              const SizedBox(height: 16),
              _buildInfoCard(
                icon: Icons.phone,
                title: "Phone".tr,
                //
                subtitle: houseDetailsController.house.phone!,
                onPressed: () => houseDetailsController
                    .launchURL('tel:${houseDetailsController.house.phone}'),
              ),
              const SizedBox(height: 16),
              _buildInfoCard(
                icon: Icons.language,
                title: "Visit the link".tr,
                subtitle: "Click to go".tr,
                onPressed: () => houseDetailsController
                    .launchURL(houseDetailsController.house.link!),
              ),
              const SizedBox(height: 16),
              GetBuilder<HouseDetailsController>(builder: (context) {
                if (houseDetailsController.house.type == "فندق") {
                  return _buildInfoCard(
                    icon: Icons.stars,
                    title: "Stars number".tr,
                    subtitle: houseDetailsController.house.stars == "/"
                        ? "No stars"
                        : houseDetailsController.house.stars!,
                    onPressed: () => houseDetailsController
                        .launchURL(houseDetailsController.house.link!),
                  );
                }
                return _buildInfoCard(
                  icon: Icons.description,
                  title: "Des".tr,
                  subtitle: houseDetailsController.house.description!,
                  onPressed: () => houseDetailsController
                      .launchURL(houseDetailsController.house.link!),
                );
              }),
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
            // houseDetailsController.order();
            houseDetailsController.showBottomSheet(context);
            // MainFunctions.showBottomSheet(
            //     context,
            //     houseDetailsController.formKey,
            //     houseDetailsController.nameController,
            //     houseDetailsController.phoneController,
            //     houseDetailsController.name,
            //     houseDetailsController.phone,
            //     houseDetailsController.makeReservation());
          },
          child: Text(
            "order".tr,
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
