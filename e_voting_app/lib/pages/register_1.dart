import 'package:e_voting_app/pages/register_form.dart';
import 'package:flutter/material.dart';

class Register1 extends StatelessWidget {
  const Register1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"), // Added title for better context
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'), // Background image
            fit: BoxFit.cover, // Ensures the image fills the whole screen
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: const Alignment(0.2, -0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centered horizontally
                children: [
                  Transform.translate(
        offset: const Offset(10, -100),
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/p1.png'),
                        fit: BoxFit.contain, // Ensures the logo fits nicely in the container
                      ),
                    ),
                  ),
                  ),
                  // Added a comma here to fix the syntax
                  const SizedBox(width: 20), // Space between logo and button
                  
                  
                ],
              ),
            ),
            Align(
              alignment: const Alignment(0.2, -0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(111, 44, 145, 1),
                          Color.fromRGBO(199, 1, 127, 1),
                        ], // Gradient colors
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> const RegisterForm()),);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.transparent, // Text color
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 15,
                        ), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                        ),
                      ),
                      child: const Text('Register'), // Added button text
                    ),
                  ),
                ],
              ),
            )
              
                ],
            
          
        ),
      ),
    );
  }
}
