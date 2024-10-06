import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/theme/main_colors.dart';
import 'package:intl/intl.dart';

import '../controller/activities.dart';

class Activities extends StatelessWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ActivitiesController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        title: Text(
          "Activities".tr,
          style: const TextStyle(color: AppColors.whiteColor),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        bottom: PreferredSize(
            preferredSize: const Size(0, 0),
            child: Container(
              color: Colors.black,
              height: 1,
            )),
      ),
      body: Obx(() {
        if (controller.posts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.inbox_outlined, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  "لا توجد منشورات حالياً".tr,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.posts.length,
            itemBuilder: (BuildContext context, int index) {
              final post = controller.posts[index];
              String formattedDate =
                  DateFormat('dd/MM/yyyy').format(post.addedDate);

              return InkWell(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Get.toNamed("/AgencyDetailsPage",
                                        arguments: post.agency);
                                  },
                                  child: CircleAvatar(
                                    radius: 25.0,
                                    backgroundImage:
                                        NetworkImage(post.agency.imageUrl),
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed("/AgencyDetailsPage",
                                            arguments: post.agency);
                                      },
                                      child: Text(
                                        post.agency.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Text(
                                      formattedDate.toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        Text(post.text),
                        const SizedBox(height: 25.0),
                        Image.network(
                          post.pictureUrl,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: 200, // Adjust as needed
                        ),
                        const SizedBox(height: 25.0),
                        // Add more details here if needed
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
