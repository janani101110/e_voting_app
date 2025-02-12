import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(0, 255, 255, 255), // Navbar background color
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 0, // No extra spread
            blurRadius: 6, // Soft blur effect
            offset: const Offset(0, 3), // Shadow appears only at the bottom
          ),
        ],
      ),
    child:  AppBar(
      
      backgroundColor: Colors.transparent, // Transparent background
      elevation: 0, // Adds shadow
      shadowColor: Colors.black.withOpacity(0.2),
      title: Row(
        
        mainAxisAlignment: MainAxisAlignment.start, // Space items evenly
        children: [const SizedBox(height: 20),
          // Left: Logo
          Image.asset(
            'assets/logo.png', // Replace with your logo path
            height: 50,
            width: 50, // Adjust size as needed
          ),

          // Center: Three words stacked
          Column(
            mainAxisSize: MainAxisSize.max,
             
            children: const [
              
              Text(
                'මැතිවරණ කොමිෂන් සභාව',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                'தேர்தல் ஆணைக்குழு',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                'Election Commission',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          // Right: Logout Button
          
        ],
      ),
    )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

