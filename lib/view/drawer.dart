import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home.dart';

import 'package:get/get.dart';

import '../../../functions/functions.dart';
import '../../../main.dart';
import 'widgets.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    // switch (currentUserInfos.type) {
    //   case "مصلح هواتف":
    //     controller = Get.find<HomeScreenRepairerController>();
    //     break;
    //   default:
    //     controller = Get.find<HomeScreenController>();
    // }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: ProfilePictureOthers(name: currentUserInfos.name!),
            ),
            accountEmail: Text(currentUserInfos.email!),
            accountName: Text(
              currentUserInfos.name!,
              style: const TextStyle(fontSize: 24.0),
            ),
            decoration: const BoxDecoration(
              color: Colors.black87,
            ),
          ),
          // if (currentUserInfos.type == "زبون")
          //   GetBuilder<HomeScreenController>(builder: (context) {
          //     if (currentUserInfos.type == "زبون") {
          //       return Column(
          //         children: [
          //           ListTile(
          //             leading: const Icon(Icons.home),
          //             title: Text(
          //               "Home".tr,
          //               style: const TextStyle(
          //                 fontSize: 18.0,
          //               ),
          //             ),
          //             onTap: () {
          //               controller.switchBetweenScreens(0);
          //               Get.back();
          //             },
          //           ),
          //           ListTile(
          //             leading: const Icon(Icons.production_quantity_limits),
          //             title: Text(
          //               "products".tr,
          //               style: const TextStyle(
          //                 fontSize: 18.0,
          //               ),
          //             ),
          //             onTap: () {
          //               controller.switchBetweenScreens(1);
          //               Get.back();
          //             },
          //           ),
          //           ListTile(
          //             leading: const Icon(Icons.shopping_cart),
          //             title: Text(
          //               "shopping cart".tr,
          //               style: const TextStyle(
          //                 fontSize: 18.0,
          //               ),
          //             ),
          //             onTap: () {
          //               controller.switchBetweenScreens(2);
          //               Get.back();
          //             },
          //           ),
          //           ListTile(
          //             leading: const Icon(Icons.work),
          //             title: Text(
          //               "Maintenance requests".tr,
          //               style: const TextStyle(
          //                 fontSize: 18.0,
          //               ),
          //             ),
          //             onTap: () {
          //               controller.switchBetweenScreens(3);
          //               Get.back();
          //             },
          //           ),
          //         ],
          //       );
          //     }
          //     return Container();
          //   }),
          // if (currentUserInfos.type == "مصلح هواتف")
          // GetBuilder<HomeScreenRepairerController>(builder: (contx) {
          // if (currentUserInfos.type == "مصلح هواتف") {
          //     return Column(
          //       children: [
          //          ],
          //     );
          //   }
          //   return Container();
          // }),
          ListTile(
            leading: const Icon(Icons.phone),
            title: Text(
              "Contact us".tr,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              controller.launchURL('tel:+213660338334');
              // controller.switchBetweenScreens(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(
              "Know us".tr,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              controller.aboutUs();
              // Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.web),
            title: Text(
              "web site".tr,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              controller.launchURL('https://easytour2.webnode.fr');
              // Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(
              "ChangeLanguage".tr,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              controller.setLanguage();
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(
              "Log out".tr,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              MainFunctions.signOutUser();
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  DrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      tileColor: Colors.white.withOpacity(0.1),
      hoverColor: Colors.white.withOpacity(0.2),
    );
  }
}
