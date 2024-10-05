import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/tourist_agency.dart';

class PostModel {
  final String id;
  final DateTime addedDate;
  final String pictureUrl;
  final String text;
  final TouristAgencyModel agency;

  PostModel({
    required this.id,
    required this.addedDate,
    required this.pictureUrl,
    required this.text,
    required this.agency,
  });

  factory PostModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return PostModel(
      id: doc.id,
      text: data['postText'],
      addedDate: (data['postsAddedDate'] as Timestamp).toDate(),
      pictureUrl: data['postsPicture'],
      agency:
          TouristAgencyModel.fromMap(data['postAgency'] as Map<String, dynamic>),
    );
  }
}
