import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_voting_app/pages/candidate.dart';

class Fistpage extends StatefulWidget {
  final int userId;
  final String nic;

  const Fistpage({super.key, required this.userId,required this.nic});

  @override
  State<Fistpage> createState() => _FistState();
}

class _FistState extends State<Fistpage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  
  String? userDivision;
  
   // Stores the fetched division

  @override
  void initState() {
    super.initState();
    _initAnimation();
    _fetchUserDivision(widget.nic); // Fetch division from DB
  }

  void _initAnimation() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  Future<void> _fetchUserDivision(String nic) async {
  final url = Uri.parse('http://10.0.2.2:8080/api/division?nic=$nic');
  try {
    final response = await http.get(url);

    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}"); // Log the response body for debugging

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.containsKey('division')) {
        setState(() {
          userDivision = data['division'];
        });
      } else {
        setState(() => userDivision = "Division not found");
      }
    } else {
      setState(() => userDivision = "User not found");
    }
  } catch (error) {
    print("Error fetching division: $error");
    setState(() => userDivision = "Unknown");
  }
}


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User ID: ${widget.userId}'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/fp.jpeg',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 300),
                _buildContainer('Presidential Election 2024'),
                const SizedBox(height: 20),
                _buildDivision(userDivision ?? "Loading..."), // Show division or loading
                const SizedBox(height: 50),
                _buildVoteButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

Widget _buildContainer(String text) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 80),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromRGBO(111, 44, 145, 1), Color.fromRGBO(199, 1, 127, 1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  Widget _buildDivision(String text) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 40),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromRGBO(111, 44, 145, 1), Color.fromRGBO(199, 1, 127, 1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
         userDivision ?? "Loading",
          style: const TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildVoteButton() {
  return AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      return Transform.scale(
        scale: _scaleAnimation.value,
        child: child,
      );
    },
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Candidate( userId: widget.userId,)),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple, // Visible color
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Center(
        child: Text(
          'Cast Your Vote Here',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

}
