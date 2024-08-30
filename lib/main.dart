import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/home_binding.dart';
import 'package:flutter_application_1/view/home.dart';
import 'package:flutter_application_1/view/houses.dart';
import 'package:flutter_application_1/view/sign_in.dart';
import 'package:flutter_application_1/view/tourist_agencies.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'functions/functions.dart';
import 'middleware/auth_middleware.dart';
import 'model/user.dart';
import 'utils/forgot_password_bindings.dart';
import 'utils/sign_in_binding.dart';
import 'utils/sign_up_binding.dart';
import 'utils/tourist_agencies_binding.dart';
import 'utils/verify_email_bindings.dart';
import 'view/email_verification.dart';
import 'view/forgot_password.dart';
import 'view/sign_up.dart';

User? currentUser = FirebaseAuth.instance.currentUser;
UserModel currentUserInfos = UserModel(
  uID: "",
  email: "",
  name: "",
);
bool prevVerfiy = false;
bool isPay = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  currentUser = FirebaseAuth.instance.currentUser;
  // await FirebaseFirestore.instance
  //     .collection("user")
  //     .doc("user2")
  //     .get()
  //     .then((value) {
  //   isPay = value.data()?["userIsPayed"];
  // });
  if (currentUser != null) {
    await MainFunctions.getcurrentUserInfos();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EASYTUOR',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      textDirection: MainFunctions.textDirection,
      getPages: [
        // GetPage(
        //     name: "/Pay",
        //     page: () => const PayView(),
        //     middlewares: [PayMiddleware()]),
        GetPage(
          name: "/SignUp",
          page: () => const SignUp(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: "/SignIn",
          page: () => const SignIn(),
          binding: SignInBinding(),
          // middlewares: [AuthMiddleware()]
        ),
        GetPage(
            name: "/EmailVerification",
            page: () => const EmailVerification(),
            binding: EmailVerificationBinding()),
        GetPage(
          name: "/ForgotPassword",
          page: () => const ForgotPassword(),
          binding: ForgotPasswordBinding(),
        ),

        GetPage(
          name: "/Home",
          page: () => const Home(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: "/Houses",
          page: () => HouseListPage(),
          // binding: HomeBinding(),
        ),
        GetPage(
          name: "/TouristAgencies",
          page: () => TouristAgenciesPage(),
          binding: TouristAgenciesBinding(),
        ),
        // GetPage(
        //   name: "/AddForm",
        //   page: () => const AddForm(),
        //   binding: AddFormBinding(),
        // ),
        // GetPage(
        //   name: "/ReservationForm",
        //   page: () => const ReservationForm(),
        //   binding: ReservationFormBinding(),
        // ),
      ],
      initialRoute: "/Home",
    );
  }
}
