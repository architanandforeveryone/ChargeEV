import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedCountryCode = "+62"; // Default country code

  // List of country codes with names (You can add more)
  final List<Map<String, String>> countryCodes = [
    {"code": "+91", "country": "🇮🇳"},
    {"code": "+1", "country": "🇺🇸"},
    {"code": "+44", "country": "🇬🇧"},
    {"code": "+62", "country": "🇮🇩"},
    {"code": "+81", "country": "🇯🇵"},
    {"code": "+971", "country": "🇦🇪"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Login",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Text("Mobile number"),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  // Country Code Dropdown
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCountryCode,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCountryCode = newValue!;
                        });
                      },
                      items: countryCodes.map((Map<String, String> country) {
                        return DropdownMenuItem<String>(
                          value: country["code"],
                          child: Row(
                            children: [
                              Text(country["country"]!),
                              SizedBox(width: 5),
                              Text(country["code"]!),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Enter your mobile number",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Text(
              "*we are sending OTP for verification",
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {},
                child: Text("Login", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Or Login using"),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(150, 50),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.facebook, color: Colors.white),
                  label:
                      Text("Facebook", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(150, 50),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.g_translate, color: Colors.white),
                  label: Text("Google", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
