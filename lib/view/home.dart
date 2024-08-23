import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/main_colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu , color: Colors.black,)),
        elevation: 0,
        // backgroundColor: AppColors.goldenColor2,
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: PreferredSize(
            preferredSize: const Size(0, 0),
            child: Container(
              color: AppColors.blackColor,
              height: 1,
            )),
      ),
      body: Center(
        child: Text("الرئيسية"),
      ),
    );
  }
}
