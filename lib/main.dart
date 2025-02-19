import 'package:ev/12A.dart';
import 'package:ev/book_slot.dart';
import 'package:ev/firebase_options.dart';
import 'package:ev/homescreen.dart';
import 'package:ev/login.dart';
import 'package:ev/myorders.dart';
import 'package:ev/otp.dart';
import 'package:ev/receipt.dart';
import 'package:ev/search.dart';
import 'package:ev/slotbook.dart';
import 'package:ev/yourprofile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
