import 'package:flutter/material.dart';
import 'pages/register_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-voting app",
      home: const HomePage(), // Use a separate HomePage widget
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background image covering the entire page
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'), // Background image
            fit: BoxFit.cover, // Ensures the image fills the whole screen
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          children: [
            Align(
              alignment: const Alignment(0.2, -0.3), // Positioning the logo slightly above the center
              child: SizedBox(
                height: 150,
                width: 150,
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      width: 100, // Changed width to 150 to match the height
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo.png'), // Path to your logo image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment(-1.6, 1.2),
                      child: Text(
                        'මැතිවරණ කොමිෂන් සභාව',
                        style: TextStyle(fontSize: 9, color: Colors.black),
                      ),
                    ),
                    const Align(
                      alignment: Alignment(-1.1, 1.4),
                      child: Text(
                        'தேர்தல் ஆணைக்குழு',
                        style: TextStyle(color: Colors.black, fontSize: 9),
                      ),
                    ),
                    const Align(
                      alignment: Alignment(-0.8, 1.6),
                      child: Text(
                        'Election Commission',
                        style: TextStyle(color: Colors.black, fontSize: 9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100), // Space between logo and buttons
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(111, 44, 145, 1),
                        Color.fromRGBO(199, 1, 127, 1)
                      ], // Gradient colors
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to Register1
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Register1()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.transparent, // Text color
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    child: const Text('Sinhala'),
                  ),
                ),
                const SizedBox(height: 10), // Space between buttons
                // Add other buttons as needed




                  const SizedBox(height: 10), // Space between buttons
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [ Color.fromRGBO(111, 44, 145,1),  Color.fromRGBO(199, 1, 127,1)], // Gradient colors
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    child: ElevatedButton(
                    
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      
                      style: ElevatedButton.styleFrom(
                        
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.transparent, // Text color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 15), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                        ),
                      ),
                      child:  Text('Tamil'),
                    ),
                  ),









                  const SizedBox(height: 10), // Space between buttons
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [ Color.fromRGBO(111, 44, 145,1), Color.fromRGBO(199, 1, 127,1)], // Gradient colors
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    child: ElevatedButton(
                    
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      
                      style: ElevatedButton.styleFrom(
                        
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.transparent, // Text color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 15), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                        ),
                      ),
                      child:  Text('English'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    
  }
  
}