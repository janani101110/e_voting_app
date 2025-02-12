import 'package:e_voting_app/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyMobileApp());
}

class MyMobileApp extends StatelessWidget {
  const MyMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-voting app",
      home: HomePage(), // Use a separate HomePage widget
    );
  }
}

