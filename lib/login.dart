import 'package:ev/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedCountryCode = "+62";
  TextEditingController phoneController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _verifyPhoneNumber() async {
    String phoneNumber = selectedCountryCode + phoneController.text.trim();

    print("📞 Sending OTP to: $phoneNumber"); // Debugging

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        print("✅ Auto-verification completed!");
      },
      verificationFailed: (FirebaseAuthException e) {
        print("❌ Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        print("✅ OTP Sent! Verification ID: $verificationId");

        // Navigate to OTP screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(
              mobileNumber: phoneNumber,
              verificationId: verificationId,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("⚠️ Auto retrieval timeout.");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Row(
              children: [
                DropdownButton<String>(
                  value: selectedCountryCode,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCountryCode = newValue!;
                    });
                  },
                  items: [
                    {"code": "+91", "country": "🇮🇳"},
                    {"code": "+1", "country": "🇺🇸"},
                    {"code": "+44", "country": "🇬🇧"},
                    {"code": "+62", "country": "🇮🇩"},
                    {"code": "+81", "country": "🇯🇵"},
                    {"code": "+971", "country": "🇦🇪"},
                  ].map((country) {
                    return DropdownMenuItem<String>(
                      value: country["code"],
                      child: Text("${country["country"]} ${country["code"]}"),
                    );
                  }).toList(),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Enter your mobile number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onPressed: _verifyPhoneNumber,
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
