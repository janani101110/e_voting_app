// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'dart:convert'; // Add this for JSON decoding
import 'package:e_voting_app/pages/regpass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  File? _selectedImageFront;
  File? _selectedImageBack;

  TextEditingController nicController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();

  Future<void> checkUserNic() async {
  final nic = nicController.text;
  final url = Uri.parse('http://10.0.2.2:8080/usernic?nic=$nic');

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final userData = jsonDecode(response.body);
      final userId = userData['id']; // Extract the user ID

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Regpass(userId: userId),
        ),
      );
    } else if (response.statusCode == 404) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Not a Valid Voter")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Unexpected error: ${response.statusCode}")),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error: ${e.toString()}")),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Form'),
      ),
      body: Container(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('NIC Number'),
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
                      controller: nicController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter NIC';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text('Photo of NIC'),
                  Row(
                    children: [
                      MaterialButton(
                        color: const Color.fromRGBO(245, 224, 248, 1),
                        child: const Text("Front"),
                        onPressed: () {
                          // Add image picker functionality here if needed
                        },
                      ),
                      const SizedBox(width: 20),
                      MaterialButton(
                        color: const Color.fromRGBO(245, 224, 248, 1),
                        child: const Text("Back"),
                        onPressed: () {
                          // Add image picker functionality here if needed
                        },
                      ),
                    ],
                  ),
                  if (_selectedImageFront != null || _selectedImageBack != null) ...[
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        if (_selectedImageFront != null)
                          Image.file(
                            _selectedImageFront!,
                            width: 100,
                            height: 100,
                          ),
                        const SizedBox(width: 20),
                        if (_selectedImageBack != null)
                          Image.file(
                            _selectedImageBack!,
                            width: 100,
                            height: 100,
                          ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 20),

                  const Text('Full Name'),
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
                      controller: fullnameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            checkUserNic();
                          }
                        },
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
          ],
        ),
      ),
    );
  }
}
