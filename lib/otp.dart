import 'dart:async';
import 'package:ev/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String mobileNumber;
  final String verificationId;

  const OTPScreen(
      {Key? key, required this.mobileNumber, required this.verificationId})
      : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  int _remainingTime = 60;
  late Timer _timer;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  void _verifyOTP() async {
    String otpCode = _otpController.text.trim();

    if (otpCode.length == 6) {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: otpCode,
        );

        await _auth.signInWithCredential(credential);
        print("✅ OTP Verified Successfully!");

        // Navigate to home screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Homescreen()));
      } catch (e) {
        print("❌ OTP Verification Failed: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Enter OTP sent to ${widget.mobileNumber}"),
              const SizedBox(height: 20),
              TextField(
                controller: _otpController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: const InputDecoration(
                  counterText: "", // Removes character counter display
                  border: OutlineInputBorder(),
                  hintText: "Enter OTP",
                ),
                onChanged: (value) {
                  if (value.length == 6) {
                    _verifyOTP(); // Auto-submit when 6 digits entered
                  }
                },
              ),
              const SizedBox(height: 20),
              Text("Time Remaining: $_remainingTime seconds"),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                onPressed: _verifyOTP,
                child: const Text("Verify OTP"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _otpController.dispose();
    super.dispose();
  }
}
