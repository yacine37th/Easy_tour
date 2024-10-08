import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/search_hotels.dart';
import '../../theme/main_colors.dart';
import 'houses.dart';

class SearchHotelsPage extends StatelessWidget {
  final SearchHotelsController controller = Get.put(SearchHotelsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.greenColor,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search for hotel".tr,
              hintStyle: const TextStyle(fontSize: 15),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: (value) {
              controller.getInputSearch(value);
              if (value.isNotEmpty) {
                controller.getSearched(value);
              } else {
                controller.professionals.clear();
                controller.addedIds.clear();
              }
            },
          ),
        ),
        bottom: PreferredSize(
            preferredSize: const Size(0, 0),
            child: Container(
              color: AppColors.blackColor,
              height: 0.6,
            )),
      ),
      body: Obx(() {
        if (controller.isFetching.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.professionals.isEmpty) {
          return Center(child: Text("There are no results for the search".tr));
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.75,
            ),
            itemCount: controller.professionals.length,
            itemBuilder: (context, index) {
              final house = controller.professionals[index];

              // return ProductCard(
              //   product: product,
              //   onTap: () {
              //     Get.toNamed("/ProductDetailsPage", arguments: product);
              //   },
              // );
              return HouseCard(house: house);
            },
          );
        }
      }),
    );
  }
}
