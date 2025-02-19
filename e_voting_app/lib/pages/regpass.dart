import 'package:e_voting_app/pages/password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Regpass extends StatefulWidget {
  final int userId;
final String nic;
  const Regpass({super.key, required this.userId, required this.nic});

  @override
  _RegpassState createState() => _RegpassState();
} 

class _RegpassState extends State<Regpass> {
  @override
  void initState() {
    super.initState();
    // Navigate to the password page after a 3-second delay
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Password(userId: widget.userId, nic: widget.nic),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User ID: ${widget.userId}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'user1'.tr,
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
