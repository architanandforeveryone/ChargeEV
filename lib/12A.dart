import 'package:flutter/material.dart';

class ChargingStation extends StatefulWidget {
  @override
  _ChargingStationState createState() => _ChargingStationState();
}

class _ChargingStationState extends State<ChargingStation> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuq94E8OJVLf9T7Nu6AV19ygCe-PjxJwJVqg&s",
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Open", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Broome Charging Station",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16, color: Colors.black),
                      SizedBox(width: 5),
                      Text("24*7hr", style: TextStyle(color: Colors.black54)),
                      SizedBox(width: 15),
                      Icon(Icons.location_on, size: 16, color: Colors.black),
                      SizedBox(width: 5),
                      Text("2.5 km", style: TextStyle(color: Colors.black54)),
                      SizedBox(width: 15),
                      Icon(Icons.star, size: 16, color: Colors.black),
                      SizedBox(width: 5),
                      Text("4.5", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "B 420 Ola Charging Station, New York, NY 100013, USA",
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 15),

                  // Connection Type Section
                  Text("Connection Type",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 180,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildConnectionTile(Icons.electric_car, "CCS2",
                              "150kw", "\$0.05/kw", "0/2 taken", Colors.green),
                          SizedBox(width: 15),
                          _buildConnectionTile(Icons.electrical_services, "CCS",
                              "120kw", "\$0.05/kw", "3/3 taken", Colors.red),
                          SizedBox(width: 15),
                          _buildConnectionTile(Icons.power, "Mennekes", "22kw",
                              "\$0.02/kw", "0/2 taken", Colors.green),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 13),
                  // Pricing & Other Info
                  Text("Pricing",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(height: 10),
                  _buildInfoRow("Per kWh", "\$0.05"),
                  _buildInfoRow("Session Fee", "\$2.00"),
                  _buildInfoRow("Idle Fee", "\$0.10/min"),
                  _buildInfoRow("Payment", "Credit/Debit, Mobile Pay"),

                  SizedBox(height: 20),
                  Text("Facilities",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFacilityCircle(Icons.local_cafe),
                      _buildFacilityCircle(Icons.wifi),
                      _buildFacilityCircle(Icons.local_gas_station),
                      _buildFacilityCircle(Icons.shopping_cart),
                    ],
                  ),

                  SizedBox(height: 28),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text("Start Charging",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Connection Tile with Status Below
  Widget _buildConnectionTile(IconData icon, String type, String power,
      String cost, String status, Color statusColor) {
    return Column(
      children: [
        Container(
          width: 110,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.black),
              SizedBox(height: 5),
              Text(type, style: TextStyle(fontWeight: FontWeight.bold)),
              Text("$power ($cost)", style: TextStyle(color: Colors.black54)),
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(
          status,
          style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Helper for displaying pricing information
  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16, color: Colors.black54)),
          Text(value,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ],
      ),
    );
  }

  // Facility Circle Icon
  Widget _buildFacilityCircle(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(icon, color: Colors.black, size: 30),
      ),
    );
  }
}
