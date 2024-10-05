class TouristAgencyModel {
  final String id;
  final String name;
  final String wilaya;
  final String location;
  final String imageUrl;
  final String rating;
  final String phone;
  final String position;
  final String website;
  final String type;

  TouristAgencyModel({
    required this.id,
    required this.name,
    required this.wilaya,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.phone,
    required this.position,
    required this.website,
    required this.type,
  });
  factory TouristAgencyModel.fromMap(Map<String, dynamic> map) {
    return TouristAgencyModel(
      id: map['touristAgencyId'],
      name: map['touristAgencyName'],
      imageUrl: map['touristAgencyIcon'],
      wilaya: map['touristAgencyWilaya'],
      location: map['touristAgencyAdress'],
      position: map['touristAgencyLocationMap'],
      phone: map['touristAgencyPhone'],
      website: map['touristAgencyLink'],
      type: map['touristAgencyType'],
      rating: '',
    );
  }
}
