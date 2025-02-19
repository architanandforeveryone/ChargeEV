import 'package:ev/homescreen.dart';
import 'package:ev/myorders.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=200&auto=format&fit=crop"),
          ),
          SizedBox(height: 10),
          Text(
            "Archit Anand",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "+91 (7303250455)",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                ProfileOption(icon: Icons.edit, title: "Edit Profile"),
                Divider(),
                SizedBox(height: 10),
                ProfileOption(icon: Icons.bookmark, title: "My booking"),
                Divider(),
                SizedBox(height: 10),
                ProfileOption(icon: Icons.language, title: "Language"),
                Divider(),
                SizedBox(height: 10),
                ProfileOption(
                    icon: Icons.description, title: "Terms and conditions"),
                Divider(),
                SizedBox(height: 10),
                ProfileOption(icon: Icons.help, title: "FAQs"),
                Divider(),
                SizedBox(height: 10),
                ProfileOption(icon: Icons.privacy_tip, title: "Privacy policy"),
                Divider(),
                SizedBox(height: 10),
                ProfileOption(icon: Icons.support, title: "Help"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.search, 'Search', false, context,
                targetPage: Homescreen()),
            _buildNavItem(Icons.route, 'En route', false, context),
            _buildNavItem(Icons.favorite_border, 'Favourite', false, context),
            _buildNavItem(Icons.person_outline, 'Profile', true, context,
                targetPage: ProfileScreen()),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;

  ProfileOption({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title),
          trailing:
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => YourOrdersPage(
                        vehicleType: "4 wheeler",
                        vehicleModel: "Volvo XC40 Recharge",
                        connectionType: "CCS",
                        date: "",
                        time: "",
                        price: 100)));
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

Widget _buildNavItem(
    IconData icon, String label, bool isSelected, BuildContext context,
    {Widget? targetPage}) {
  return GestureDetector(
    onTap: () {
      if (targetPage != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      }
    },
    child: Column(
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
    ),
  );
}
