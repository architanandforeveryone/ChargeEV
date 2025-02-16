import 'package:ev/12A.dart';
import 'package:ev/homescreen.dart';
import 'package:ev/login.dart';
import 'package:ev/myorders.dart';
import 'package:ev/receipt.dart';
import 'package:ev/search.dart';
import 'package:ev/slotbook.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BookSlotScreen());
  }
}
