import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/tourist_agency.dart';
import '../../model/tourist_agency.dart';
import '../../theme/colors.dart';
import '../../theme/main_colors.dart';
import 'agency_details.dart';

// class TouristAgenciesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     TouristAgenciesController touristAgenciesController = Get.find();
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.greenColor,
//         title: Text(
//           "Tourist Agencies".tr,
//           style: const TextStyle(color: AppColors.whiteColor),
//         ),
//         leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios_new_outlined,
//               color: Colors.white,
//             )),
//         bottom: PreferredSize(
//             preferredSize: const Size(0, 0),
//             child: Container(
//               color: AppColors.whiteColor,
//               height: 1,
//             )),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: GetBuilder<TouristAgenciesController>(
//           builder: (contx) => ListView.builder(
//             itemCount: touristAgenciesController.agencies.length,
//             itemBuilder: (context, index) {
//               final agency = touristAgenciesController.agencies[index];
//               return AgencyCard(agency: agency);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AgencyCard extends StatelessWidget {
//   final TouristAgencyModel agency;

//   const AgencyCard({required this.agency});

//   @override
//   Widget build(BuildContext context) {
//     TouristAgenciesController touristAgenciesController = Get.find();
//     return GestureDetector(
//       onTap: () {
//         // Get.to(() => AgencyDetailsPage(agency: agency));
//         if (agency.type == "تاشيرة الكترونية") {
//           touristAgenciesController.launchURL(agency.website);
//         } else {
//           Get.toNamed("/AgencyDetailsPage", arguments: agency);
//         }
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //       builder: (context) => AgencyDetailsPage(agency: agency)),
//         // );
//         print("object");
//       },
//       child: Card(
//         margin: const EdgeInsets.symmetric(vertical: 10),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         elevation: 5,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             GetBuilder<TouristAgenciesController>(
//               // init: MyController(),
//               // initState: (_) {},
//               builder: (_) {
//                 if (agency.type == "تاشيرة الكترونية") {
//                   return
//                       //  ClipRRect(
//                       //   borderRadius:
//                       //       const BorderRadius.vertical(top: Radius.circular(15)),
//                       //   child: Image.asset(
//                       //     "assets/images/visa.png",
//                       //     height: 180,
//                       //     width: double.infinity,
//                       //     fit: BoxFit.contain,
//                       //   ),
//                       // );
//                       CarouselSlider.builder(
//                           itemCount:
//                               touristAgenciesController.publicities.length,
//                           itemBuilder: (context, index, realIndex) {
//                             return InkWell(
//                               onTap: () async {},
//                               child: Container(
//                                 margin:
//                                     const EdgeInsets.only(left: 2, right: 2),
//                                 width: 2000,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     border: Border.all(
//                                       color: greyColor,
//                                     ),
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: AssetImage(
//                                             touristAgenciesController
//                                                 .publicities.values
//                                                 .elementAt(index)
//                                                 .imageUrl))),
//                               ),
//                             );
//                           },
//                           options: CarouselOptions(
//                               enlargeCenterPage: true,
//                               enlargeFactor: 0.17,
//                               autoPlayInterval: const Duration(seconds: 5),
//                               height: 120,
//                               enableInfiniteScroll: true
//                               // homeRa2isiyaController.carouselBooks.length != 1
//                               //     ? true
//                               //     : false
//                               ,
//                               autoPlay: true
//                               // homeRa2isiyaController.carouselBooks.length != 1
//                               //     ? true
//                               //

//                               ));
//                 }
//                 return Container(
//                   child: Text(agency.location),
//                 );
//                 // ClipRRect(
//                 //   borderRadius:
//                 //       const BorderRadius.vertical(top: Radius.circular(15)),
//                 //   child:Text(agency.imageUrl)
//                 //   //  Image.network(
//                 //   //   agency.imageUrl,
//                 //   //   height: 180,
//                 //   //   width: double.infinity,
//                 //   //   fit: BoxFit.contain,
//                 //   // ),
//                 // );
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: GetBuilder<TouristAgenciesController>(
//                 builder: (_) {
//                   if (agency.type == "تاشيرة الكترونية") {
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Electronic visa".tr,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "Click to go".tr,
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                       ],
//                     );
//                   }
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         agency.name,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         agency.wilaya,
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         agency.location,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class TouristAgenciesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.greenColor,
          title: Text(
            "Tourist Agencies".tr,
            style: const TextStyle(color: AppColors.whiteColor),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: "Tourist Agencies".tr),
              Tab(text: "Electronic visa".tr),
            ],
            indicatorColor: AppColors.whiteColor,
            labelColor: AppColors.whiteColor,
          ),
        ),
        body: TabBarView(
          children: [
            AgencyListView(agencyType: "وكالة سياحية"),
            AgencyListView(agencyType: "تاشيرة الكترونية"),
          ],
        ),
      ),
    );
  }
}

class AgencyListView extends StatelessWidget {
  final String agencyType;

  const AgencyListView({Key? key, required this.agencyType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TouristAgenciesController>(
      builder: (controller) {
        // Debug print
        print('Total agencies: ${controller.agencies.length}');
        print(
            'Agencies of type $agencyType: ${controller.agencies.where((agency) => agency.type == agencyType).length}');

        final filteredAgencies = controller.agencies
            .where((agency) => agency.type == agencyType)
            .toList();

        if (filteredAgencies.isEmpty) {
          return Center(child: Text('No agencies found for type: $agencyType'));
        }

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
            itemCount: filteredAgencies.length,
            itemBuilder: (context, index) {
              final agency = filteredAgencies[index];
              return AgencyCard(agency: agency);
            },
          ),
        );
      },
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
        if (agency.type == "تاشيرة الكترونية") {
          touristAgenciesController.launchURL(agency.website);
        } else {
          Get.toNamed("/AgencyDetailsPage", arguments: agency);
        }
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
            GetBuilder<TouristAgenciesController>(
              // init: MyController(),
              // initState: (_) {},
              builder: (_) {
                if (agency.type == "تاشيرة الكترونية") {
                  return
                      //  ClipRRect(
                      //   borderRadius:
                      //       const BorderRadius.vertical(top: Radius.circular(15)),
                      //   child: Image.asset(
                      //     "assets/images/visa.png",
                      //     height: 180,
                      //     width: double.infinity,
                      //     fit: BoxFit.contain,
                      //   ),
                      // );
                      CarouselSlider.builder(
                          itemCount:
                              touristAgenciesController.publicities.length,
                          itemBuilder: (context, index, realIndex) {
                            return InkWell(
                              onTap: () async {},
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 2, right: 2),
                                width: 2000,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: greyColor,
                                    ),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            touristAgenciesController
                                                .publicities.values
                                                .elementAt(index)
                                                .imageUrl))),
                              ),
                            );
                          },
                          options: CarouselOptions(
                              enlargeCenterPage: true,
                              enlargeFactor: 0.17,
                              autoPlayInterval: const Duration(seconds: 5),
                              height: 120,
                              enableInfiniteScroll: true
                              // homeRa2isiyaController.carouselBooks.length != 1
                              //     ? true
                              //     : false
                              ,
                              autoPlay: true
                              // homeRa2isiyaController.carouselBooks.length != 1
                              //     ? true
                              //

                              ));
                }
                return
                    // Container(
                    //   child: Text(agency.location),
                    // );
                    ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.network(
                    agency.imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      print('Error loading image: $error');
                      return Container(
                        color: Colors.grey,
                        child: Center(child: Text('Image not available')),
                      );
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GetBuilder<TouristAgenciesController>(
                builder: (_) {
                  if (agency.type == "تاشيرة الكترونية") {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Electronic visa".tr,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Click to go".tr,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    );
                  }
                  return Column(
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
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
