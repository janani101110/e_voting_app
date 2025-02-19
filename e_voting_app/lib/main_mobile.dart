import 'package:e_voting_app/LocalStrings.dart';
import 'package:e_voting_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyMobileApp());
}

class MyMobileApp extends StatelessWidget {
  const MyMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      translations: Localstrings(),
      locale: Locale('en','US'),
      debugShowCheckedModeBanner: false,
      title: "E-voting app",
      home: HomePage(), // Use a separate HomePage widget
    );
  }
}

