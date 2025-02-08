import 'package:flutter/material.dart';

class Votedone extends StatefulWidget {
  final int userId;

  const Votedone({super.key, required this.userId});

  @override
  _VotedoneState createState() => _VotedoneState();
}

class _VotedoneState extends State<Votedone> {
  @override
  void initState() {
    super.initState();
    // Navigate to the password page after a 3-second delay
    // Future.delayed(const Duration(seconds: 6), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) =>
    //           Password(userId: widget.userId, nic: widget.nic),
    //     ),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User ID: ${widget.userId}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You Have Voted Successfully',
              style: TextStyle(
                color: Color.fromRGBO(111, 44, 145, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/finger.png',
              width: 200,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
