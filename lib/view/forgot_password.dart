import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/forgot_password_controller.dart';
import '../theme/main_colors.dart';
import 'widgets.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController forgotPasswordController = Get.find();
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
              // size: 18,
            )),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          height: screenHeight / 1.35,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: forgotPasswordController.pageController,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "نسيت كلمة المرور ؟",
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "أدخل بريدك الإلكتروني ، وسنرسل لك رابطا لإدخال كلمة مرور جديدة.",
                    style: TextStyle(fontSize: 17),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Form(
                    key: forgotPasswordController.emailFormKey,
                    child: Column(children: [
                      GetBuilder<ForgotPasswordController>(builder: (context) {
                        return TextFormField(
                          style: const TextStyle(color: Colors.black),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "الرجاء إدخال بريد إلكتروني";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                .hasMatch(val)) {
                              return "الرجاء إدخال بريد إلكتروني صحيح";
                            }
                            return null;
                          },
                          onChanged: (emailAddress) {
                            forgotPasswordController
                                .inputfgbEmail(emailAddress);
                          },
                          decoration: InputDecoration(
                            hintText: 'البريد الإلكتروني',
                            errorMaxLines: 2,
                            prefixIcon: const EmailIcon(),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.kLine),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            fillColor: AppColors.inputBg,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.kPrimary2),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.kLine),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.KError),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: TextButton(
                          onPressed: () {
                            if (forgotPasswordController
                                .emailFormKey.currentState!
                                .validate()) {
                              forgotPasswordController
                                  .emailFormKey.currentState!
                                  .save();
                              forgotPasswordController.sendEmail();
                            }
                          },
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                AppColors.greenColor,
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                AppColors.greenColor,
                              ),
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white.withOpacity(0.1)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      side: BorderSide(
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
                                // color: AppColors.kPrimary,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                "إرسال الرابط",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
              Column(
                children: [
                  Text.rich(TextSpan(
                      style: const TextStyle(fontFamily: 'Cairo', fontSize: 19),
                      children: [
                        const TextSpan(
                          text:
                              "تم إرسال بريد إلكتروني لتغيير كلمة المرور لحسابك: ",
                        ),
                        TextSpan(
                            text: forgotPasswordController.fgpEmail.toString())
                      ])),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      navigator!.pop();
                    },
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                          AppColors.kPrimary2,
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          AppColors.kPrimary2,
                        ),
                        overlayColor: MaterialStateColor.resolveWith((states) =>
                            AppColors.kPrimary2Onpress.withOpacity(0.2)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: const BorderSide(
                              color: AppColors.kPrimary2,
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
                        child: const Text(
                          "متابعة",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
