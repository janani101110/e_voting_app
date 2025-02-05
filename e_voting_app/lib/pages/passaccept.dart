

import 'package:e_voting_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Passaccept extends StatefulWidget {
  final String nic;
  const Passaccept({super.key, required this.nic});

  @override
  _PassacceptState createState() => _PassacceptState();
}

class _PassacceptState extends State<Passaccept> {
  @override
  void initState() {
    super.initState();
    // Navigate to Login after animation
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Password Accepted')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Password Accepted',
              style: TextStyle(
                color: Color.fromRGBO(111, 44, 145, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Lottie.asset(
              'assets/Done.json', // Path to your JSON file
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
