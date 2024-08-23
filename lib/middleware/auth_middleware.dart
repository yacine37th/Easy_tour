import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (currentUser != null) {
      // switch (currentUserInfos.type) {
      //   case "Student":
      //     return const RouteSettings(name: "/HomeStudent");
      //   default:
      //     return const RouteSettings(name: "/Home");
      // }
    }
    return null;
  }
}
