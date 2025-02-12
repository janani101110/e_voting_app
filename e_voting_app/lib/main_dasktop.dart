import 'package:e_voting_app/desktop_pages/home_desktop.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyDesktopApp());
}

class MyDesktopApp extends StatelessWidget {
  const MyDesktopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Vote Admin Panel',
      home: HomeDesktop(),
    );
  }
}
