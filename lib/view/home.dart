import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home.dart';
import 'package:flutter_application_1/view/drawer.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';
import '../theme/main_colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: AppColors.greenColor,
          // leading: IconButton(
          //     onPressed: () {
          //       Scaffold.of(context).openDrawer();
          //     },
          //     icon: const Icon(
          //       Icons.menu,
          //       color: Colors.white,
          //     )),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: PreferredSize(
              preferredSize: const Size(0, 0),
              child: Container(
                color: AppColors.blackColor,
                height: 1,
              )),
        ),
        body: ListView(
          children: [
            GetBuilder<HomeController>(builder: (context) {
              if (homeController.publicities.isEmpty) {
                return const SizedBox();
              } else {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    CarouselSlider.builder(
                        itemCount: homeController.publicities.length,
                        itemBuilder: (context, index, realIndex) {
                          return InkWell(
                            onTap: () async {},
                            child: Container(
                              margin: const EdgeInsets.only(left: 2, right: 2),
                              width: 2000,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: greyColor,
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                          homeController.publicities.values
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

                            )),
                  ],
                );
              }
            }),
       
            const SizedBox(
              height: 35,
            ),
            const SizedBox(height: 16),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                    itemCount: homeController.flutterTopicsList.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      final topicsData =
                          homeController.flutterTopicsList[index];
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              print(topicsData.link);
                              Get.toNamed(topicsData.link,
                                  arguments: topicsData.topicName);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 12),
                              decoration: BoxDecoration(
                                color: AppColors.greenColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      topicsData.topicName,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset(
                                    topicsData.topicIcon,
                                    height: 60,
                                    width: 60,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      );
                    })),
          ],
        ));
  }
}
