import 'package:e_voting_app/pages/candidate.dart';
import 'package:e_voting_app/pages/votedone.dart'; 
import 'package:flutter/material.dart';

class Confirmvote extends StatefulWidget {
  final int userId;
  final Map<String, String> candidate;
  const Confirmvote({super.key, required this.userId, required this.candidate});

  @override
  State<Confirmvote> createState() => _ConfirmvoteState();
}

class _ConfirmvoteState extends State<Confirmvote> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('userid: ${widget.userId}'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Text(
                'Confirm Your Vote',
                style: TextStyle(
                  color: Color.fromRGBO(111, 44, 145, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 85),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.account_circle,
                          size: 50,
                          color: Color.fromRGBO(111, 44, 145, 1),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.candidate['name']!, // Candidate Name (widget.candidate)
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              widget.candidate['party']!, // Candidate Party (widget.candidate)
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
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
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 207, 163, 217)
                                  .withOpacity(0.5), // Purple shadow
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // Shadow direction
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () { 
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Votedone(
                                  userId: widget.userId, // Pass userId
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                const SizedBox(height: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(111, 44, 145, 1)
                                .withOpacity(0.5), // Purple shadow
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 1), // Shadow direction
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Candidate(
                                  userId: widget.userId), // Pass userId
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // White button
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: Color.fromRGBO(
                                    111, 44, 145, 1)), // Purple border
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Color.fromRGBO(
                                    111, 44, 145, 1),
                                    fontWeight: FontWeight.bold), // Purple text
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
