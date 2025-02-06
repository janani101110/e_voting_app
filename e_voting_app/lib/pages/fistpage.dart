import 'package:e_voting_app/pages/candidate.dart';
import 'package:flutter/material.dart';

class Fistpage extends StatefulWidget {
  const Fistpage({super.key});

  @override
  State<Fistpage> createState() => _FistState();
}

class _FistState extends State<Fistpage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and the scale animation
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this, // TickerProvider required for animations
    )..repeat(reverse: true); // Repeat the animation in reverse

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Don't forget to dispose of the controller
    super.dispose();
  }

  // Simulated user division (Replace with actual user data)
  String userDivision = "Moratuwa"; // Fetch this dynamically in a real app

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firstpage')),
      body: Stack(
        children: [
          // Background image covering the upper half
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/fp.jpeg', // Replace with actual image path
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5, // Covers upper half
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: Colors.black.withOpacity(0.5), // Dark overlay with 50% opacity
                  ),
                ],
              ),
            ),
          ),

          // Foreground content
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 300),

                // Presidential Election Container
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(minHeight: 80),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(111, 44, 145, 1),
                        Color.fromRGBO(199, 1, 127, 1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Presidential Election 2024',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                const SizedBox(height: 20), // Space between container and division text

                // Division Container (Now Fetches User's Division)
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(minHeight: 20),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(111, 44, 145, 1),
                        Color.fromRGBO(199, 1, 127, 1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      userDivision, // Displays the user's division dynamically
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                const SizedBox(height: 50), // Space before the voting button

                // Animated Vote Button with Auto Scaling
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: child,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 5), // Expands width slightly
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(111, 44, 145, 1),
                          Color.fromRGBO(199, 1, 127, 1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12), // Slightly increased radius
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Candidate(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Transparent to show gradient
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10), // Increased padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Cast Your Vote Here',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
