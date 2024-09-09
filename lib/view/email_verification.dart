import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controller/verify_email_controller.dart';
import '../theme/main_colors.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    EmailVerificationController emailVerificationController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.whiteColor,
            )),
        title: Text(
          "Email verification".tr,
          style: const TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  child:
                      Lottie.asset('assets/animation/email-verification.json'),
                ),
              ),
              Text(
                  "A verification message has been sent to your email address"
                      .tr,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: TextButton(
                  onPressed: () {
                    emailVerificationController.resendVerificationEmail();
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                        AppColors.greenColor,
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        AppColors.greenColor,
                      ),
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.greenColor.withOpacity(0.2)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: const BorderSide(
                            color: AppColors.greenColor,
                          )))),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    color: Colors.transparent,
                    child: Container(
                      height: 35,
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Resend".tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
