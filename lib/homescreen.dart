import 'dart:ui';
import 'package:ev/12A.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Map Image
          Stack(children: [
            Image.network(
              'https://developers.google.com/static/maps/documentation/android-sdk/images/zoom-level-14.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 2, sigmaY: 2), // Adjust blur intensity
              child: Container(
                color: Colors.black
                    .withOpacity(0.05), // Slight overlay for better visibility
              ),
            )
          ]),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Top Bar with Profile and Search
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=200&auto=format&fit=crop',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Esther Howard',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const Text(
                              'Find your nearest charging point',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.black,
                          size: 28,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search location',
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                // Station Cards PageView
                SizedBox(
                  height: 200, // Fixed height for the cards
                  child: PageView(
                    padEnds: false,
                    controller: PageController(viewportFraction: 0.93),
                    children: const [
                      StationCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1593941707882-a5bba14938c7?q=80&w=150&auto=format&fit=crop',
                        name: '12A charging station',
                        address: 'Sec-62 , Noida ,UP',
                        hours: '24*7hr',
                        distance: '2.5 km',
                        rating: '4.5',
                      ),
                      StationCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1593941707882-a5bba14938c7?q=80&w=150&auto=format&fit=crop',
                        name: 'Tesla Supercharger',
                        address: '350 5th Avenue,\nNew York, NY 10118',
                        hours: '24*7hr',
                        distance: '3.8 km',
                        rating: '4.8',
                      ),
                      StationCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1593941707882-a5bba14938c7?q=80&w=150&auto=format&fit=crop',
                        name: 'ChargePoint Station',
                        address: '89 E 42nd Street,\nNew York, NY 10017',
                        hours: '6am-11pm',
                        distance: '1.2 km',
                        rating: '4.3',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Bottom Navigation Bar
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(Icons.search, 'Search', true),
                      _buildNavItem(Icons.route, 'En route', false),
                      _buildNavItem(Icons.favorite_border, 'Favourite', false),
                      _buildNavItem(Icons.person_outline, 'Profile', false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class StationCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String address;
  final String hours;
  final String distance;
  final String rating;

  const StationCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.hours,
    required this.distance,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChargingStation()),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        address,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 16),
                          Text(' $hours'),
                          const SizedBox(width: 16),
                          const Icon(Icons.location_on, size: 16),
                          Text(' $distance'),
                          const SizedBox(width: 16),
                          const Icon(Icons.star, size: 16),
                          Text(' $rating'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Get direction',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
