import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class PayMiddleware extends GetMiddleware {
  @override
  int? get priority => 0;
  @override
  RouteSettings? redirect(String? route) {
    if (isPay) {
      //  MainFunctions.getcurrentUserInfos();
      // MainFunctions.loadTripsDriversData();
      return const RouteSettings(name: "/SignIn");
    } else {
      return null;
    }
  }
}
