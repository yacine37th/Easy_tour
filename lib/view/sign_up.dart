import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/sign_up.dart';
import '../theme/main_colors.dart';
import 'widgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.find();
    return Scaffold(
        appBar: AppBar(
          backgroundColor:  AppColors.kPrimary2,
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
        backgroundColor: Colors.white,
        body: ListView(
          padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          physics: const BouncingScrollPhysics(),
          children: [
            const Text(
              'مرحباً بك في تطبيق اقامتي\nقم بإنشاء حساب جديد',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25.0),
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: signUpController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (username) {
                        signUpController.userName = username;
                      },
                      onChanged: (username) {
                        signUpController.userName = username.trim();
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "الرجاء ملء اسم الاقامة الخاص بك";
                        }
                        return null;
                      },
                      initialValue: signUpController.userName,
                      decoration: InputDecoration(
                        hintText: 'اسم الاقامة',
                        errorMaxLines: 2,
                        prefixIcon: const Icon(
                          Icons.person_2_outlined,
                          color: AppColors.kPrimary2,
                          size: 25,
                        ),
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
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField(
                        value: signUpController.selectedValue,
                        hint: const Text("الولاية",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey)),
                        focusColor: AppColors.kPrimary2,
                        decoration: InputDecoration(
                          hintText: "الولاية",
                          errorMaxLines: 2,
                          prefixIcon: const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.kPrimary2,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.kLine),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          // border: InputBorder.none,
                          fillColor: AppColors.inputBg,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.kPrimary2),
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
                        isExpanded: true,
                        onChanged: (value) {
                          signUpController.selectedValue = value;
                        },
                        onSaved: (value) {
                          signUpController.selectedValue = value;
                        },
                        validator: (value) =>
                            value == null ? "يرجى اختيار الولاية" : null,
                        items: signUpController.wilayas.map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          );
                        }).toList()),
                    const SizedBox(height: 20),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (userEmailAddress) {
                        signUpController.userEmailAddress =
                            userEmailAddress;
                      },
                      onChanged: (userEmailAddress) {
                        signUpController.userEmailAddress =
                            userEmailAddress.trim();
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "من فضلك املأ البريد الإلكتروني";
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                            .hasMatch(val)) {
                          return "من فضلك املأ بريد إلكتروني صحيح";
                        }
                        return null;
                      },
                      initialValue: signUpController.userEmailAddress,
                      decoration: InputDecoration(
                        hintText: 'البريد الإكتروني',
                        errorMaxLines: 2,
                        prefixIcon: const EmailIcon(),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.kLine),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        // border: InputBorder.none,
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
                    ),
                    const SizedBox(height: 20),
                    GetBuilder<SignUpController>(
                      builder: (contx) => TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: contx.showPassword,
                        onSaved: (userpass) {
                          signUpController.userPassword = userpass;
                        },
                        onChanged: (userpass) {
                          signUpController.userPassword = userpass.trim();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "من فضلك املأ كلمة المرور";
                          }
                          return null;
                        },
                        initialValue: signUpController.userPassword,
                        decoration: InputDecoration(
                          hintText: 'كلمة السر',
                          errorMaxLines: 2,
                          prefixIcon: const PasswordKeyIcon(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                contx.invertShowPassword();
                              },
                              icon: contx.showPassword
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          suffixIconColor: AppColors.kPrimary2,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.kLine),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          // border: InputBorder.none,
                          fillColor: AppColors.inputBg,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.kPrimary2),
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
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: TextButton(
                        onPressed: () {
                          if (signUpController.formKey.currentState!
                              .validate()) {
                            signUpController.formKey.currentState!.save();
                            signUpController.createNewUser();
                          }
                        },
                        style: ButtonStyle(
                            foregroundColor: WidgetStateProperty.all(
                              AppColors.kPrimary2,
                            ),
                            backgroundColor: WidgetStateProperty.all(
                              AppColors.kPrimary2,
                            ),
                            overlayColor: WidgetStateColor.resolveWith(
                                (states) => Colors.white.withOpacity(0.1)),
                            shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(100),
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
                              // color: AppColors.kPrimary,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              "تسجيل حساب جديد",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
