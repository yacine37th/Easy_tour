import 'package:flutter/material.dart';

class House {
  final String imageUrl;
  final String title;
  final String location;
  final double price;
  final int bedrooms;
  final int bathrooms;
  final int parkingSpaces;

  House({
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.parkingSpaces,
  });
}

class HouseListPage extends StatelessWidget {
  final List<House> houses = [
    House(
      imageUrl: 'assets/images/house1.png',
      title: 'Luxury Villa',
      location: 'Los Angeles, CA',
      price: 2500000,
      bedrooms: 4,
      bathrooms: 3,
      parkingSpaces: 2,
    ),
    House(
      imageUrl: 'assets/images/house1.png',
      title: 'Modern Apartment',
      location: 'New York, NY',
      price: 1500000,
      bedrooms: 2,
      bathrooms: 2,
      parkingSpaces: 1,
    ),
    // Add more houses here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Houses'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: houses.length,
          itemBuilder: (context, index) {
            final house = houses[index];
            return HouseCard(house: house);
          },
        ),
      ),
    );
  }
}

class HouseCard extends StatelessWidget {
  final House house;

  const HouseCard({required this.house});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                house.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  house.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  house.location,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '\$${house.price.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFeatureIcon(Icons.king_bed, house.bedrooms),
                    _buildFeatureIcon(Icons.bathtub, house.bathrooms),
                    _buildFeatureIcon(Icons.directions_car, house.parkingSpaces),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, int count) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        SizedBox(width: 4),
        Text('$count', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
