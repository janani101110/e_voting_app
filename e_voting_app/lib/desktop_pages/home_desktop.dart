import 'package:e_voting_app/desktop_pages/polling_candidate.dart';
import 'package:flutter/material.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({super.key});
 
  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bimage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              SizedBox(
                height: 150,
                width: 100,
                child: Image.asset('assets/logo.png', fit: BoxFit.cover),
              ),

              const SizedBox(height: 10),

              // Election Commission Texts
              Column(
                children: const [
                  Text(
                    'මැතිවරණ කොමිෂන් සභාව',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  Text(
                    'தேர்தல் ஆணைக்குழு',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  Text(
                    'Election Commission',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Admin Login Title
              const Text(
                'Admin Login',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(111, 44, 145, 1),
                ),
              ),

              const SizedBox(height: 20),

              // Password Input Field with Shorter Width
              SizedBox(
                width: 300, // Shorter width
                child: TextFormField(
                  obscureText: true, // Hide password
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Submit Button
              Center(
                child: Container(
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
                  child: ElevatedButton(
                    onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PollingCandidate()),
                      );

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      'Enter',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
