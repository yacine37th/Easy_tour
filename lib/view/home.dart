import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';
import '../theme/main_colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
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
                              margin: EdgeInsets.only(left: 2, right: 2),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.flutterTopicsList.length,
                itemBuilder: (context, index) {
                  final topicsData = homeController.flutterTopicsList[index];
                  return GestureDetector(
                    onTap: () {
                      print(topicsData.link);
                      Get.toNamed(topicsData.link,
                          arguments: topicsData.topicName);
                    },
                    child: Card(
                      color: AppColors.greenColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                topicsData.topicIcon,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              topicsData.topicName,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
