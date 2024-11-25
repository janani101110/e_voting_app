import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:e_voting_app/pages/passaccept.dart';

class Password extends StatefulWidget {
  final int userId;

  const Password({super.key, required this.userId});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? savedPassword;

  @override
  void dispose() {
    _passwordController.dispose(); // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  Future<void> _updatePassword() async {
  if (_formKey.currentState?.validate() != true) return;

  final url = Uri.parse('http://10.0.2.2:8080/user/${widget.userId}');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'password': _passwordController.text}),
  );

  if (response.statusCode == 200) {
    
    // Navigate to PassAccept page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Passaccept(userId: widget.userId),
      ),
    );
  } else if (response.statusCode == 404) {
    // User not found
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User not found. Password not updated.')),
    );
  } else {
    // Other errors
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('An error occurred. Please try again.')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User ID: ${widget.userId}')),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Text(
                'Password',
                style: TextStyle(
                  color: Color.fromRGBO(111, 44, 145, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 120),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  obscureText: true, // Hides the password input
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 35),
              Align(
                alignment: Alignment.centerRight,
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
                    onPressed: _updatePassword,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      'Submit',
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
