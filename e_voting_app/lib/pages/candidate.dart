import 'package:e_voting_app/pages/confirmvote.dart';
import 'package:flutter/material.dart';

class Candidate extends StatefulWidget {
  final int userId;

  const Candidate({super.key, required this.userId});

  @override
  State<Candidate> createState() => _candidateState();
}

class _candidateState extends State<Candidate> {
  // List of candidates
   // this whole page is still hardcoded. these candidates should
   //be here when the admin enter them


  final List<Map<String, String>> candidates = [
    {'name': 'Janantha Jayakantha', 'party': 'National Rabbit Congrass'},
    {'name': 'Chandrakumara', 'party': 'United Brilliant Party'},
    {'name': 'Anuhas Kapila', 'party': 'National SecondOver Party'},
    {'name': 'Cocomelon', 'party': 'Sri Lanka Coconut Party'},
    {'name': 'Candidate 5', 'party': 'Party E'},
    {'name': 'Candidate 6', 'party': 'Party F'},
  ];

  
void _castVote(int userId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Confirmvote(
          userId: userId,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User ID: ${widget.userId}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Global padding for the whole body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Center(
              child: Text(
                'Select Your Candidate',
                style: TextStyle(
                  color: Color.fromRGBO(111, 44, 145, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Presidential Election 2024',
              style: TextStyle(
                color: Color.fromRGBO(111, 44, 145, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // List of candidate cards
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: List.generate(candidates.length, (index) {
                    final candidate = candidates[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0), // Padding between each card
                      child: InkWell(
                        onTap: () => _castVote(widget.userId),
                        child: Container(
                          padding: const EdgeInsets.all(25.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(111, 44, 145, 1)
                                    .withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              
                              ),
                            ],
                          ),
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
                                    candidate['name']!, // Candidate Name
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    ' ${candidate['party']}', // Candidate Party
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
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
