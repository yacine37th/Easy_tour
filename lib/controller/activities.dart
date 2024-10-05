import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/post.dart';
import 'package:get/get.dart';

class ActivitiesController extends GetxController {
  final RxList<PostModel> posts = <PostModel>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() {
    _firestore.collection("posts").snapshots().listen((snapshot) {
      posts.value =
          snapshot.docs.map((doc) => PostModel.fromFirestore(doc)).toList();
    });
  }

  Future<void> deletePost(String id) async {
    // Implement the logic for accepting the post
    var doc = await FirebaseFirestore.instance.collection("posts").doc(id);
    Get.defaultDialog(
      title: 'تأكيد',
      middleText: 'هل أنت متأكد أنك تريد حدف هذا المنشور '.tr,
      textConfirm: 'نعم'.tr,
      textCancel: 'لا'.tr,
      confirmTextColor: Colors.white,
      onConfirm: () {
        doc.delete().then((_) {
          // Remove the post from the map after confirmation
          update();
          print('تم قبول العنصر وإزالته من القائمة');
          Get.back();
        }).catchError((error) {
          print('حدث خطأ أثناء قبول العنصر: $error');
        });
      },
      onCancel: () {
        print('تم إلغاء القبول');
      },
    );
  }
}
