class HouseModel {
  late String? id;
  late List<dynamic> imageUrl;
  late String? wilaya;
  late String? adress;
  late String? phone;
  late String? link;
  late String? location;
  late String? type;
  late String? description;
  late String? stars;
  late String? name;

  HouseModel({
    required this.id,
    required this.imageUrl,
    required this.wilaya,
    required this.adress,
    required this.phone,
    required this.link,
    required this.location,
    required this.description,
    required this.stars,
    required this.type,
    required this.name,
  });
}
