import 'package:e_voting_app/desktop_pages/polling_confirm.dart';
import 'package:e_voting_app/widgets/navbar.dart';
import 'package:flutter/material.dart';

class PollingCandidate extends StatefulWidget {
  const PollingCandidate({super.key});

  @override
  State<PollingCandidate> createState() => _PollingCandidateState();
}

class _PollingCandidateState extends State<PollingCandidate> { 
  final List<Map<String, String>> candidates = [
    {'name': 'Janantha Jayakantha', 'party': 'National Rabbit Congrass'},
    {'name': 'Chandrakumara', 'party': 'United Brilliant Party'},
    {'name': 'Anuhas Kapila', 'party': 'National SecondOver Party'},
    {'name': 'Cocomelon', 'party': 'Sri Lanka Coconut Party'},
    {'name': 'Candidate 5', 'party': 'Party E'},
    {'name': 'Candidate 6', 'party': 'Party F'},
  ];

  void _castVote(Map<String, String> candidate) {
    Navigator.push(
      context,
      MaterialPageRoute(
builder: (context) => PollingConfirm(candidate: candidate),
        ),
      );
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: Padding(
        padding:
            const EdgeInsets.all(20.0), // Global padding for the whole body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              width: double.infinity, // Full width of the screen
              height: 150,
              // padding: const EdgeInsets.symmetric(vertical: 10), // Adds height
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(111, 44, 145, 1),
                    Color.fromRGBO(199, 1, 127, 1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10), // Rounded edges
              ),
              alignment: Alignment.centerLeft, // Center text inside
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Center the row
                children: [
                  const SizedBox(width: 130), // Add spacing to the left
                  const Text(
                    'Presidential Election 2024',
                    style: TextStyle(
                      fontSize: 28, // Large font size
                      fontWeight: FontWeight.bold, // Bold text
                      color: Colors.white, // White color for contrast
                      letterSpacing:
                          1.5, // Slight spacing for better readability
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 600),
                  SizedBox(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/pol.png', fit: BoxFit.fill),
                  )
                ],
              ),
            ),
const SizedBox(height: 50),
            Center(
              child: Text(
                'Select Your Candidate For Presidential Election 2024',
                style: TextStyle(
                  color: Color.fromRGBO(111, 44, 145, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
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
                      padding: const EdgeInsets.only(
                          bottom: 15.0), // Padding between each card
                      child: InkWell(
                        onTap: () => _castVote(candidate),

                        child: Container(
                          width: 600,
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
                              const SizedBox(width: 200),
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
