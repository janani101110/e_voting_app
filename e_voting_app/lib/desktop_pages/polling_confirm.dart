import 'package:e_voting_app/desktop_pages/polling_candidate.dart';
import 'package:e_voting_app/desktop_pages/polling_votedone.dart';
import 'package:e_voting_app/widgets/navbar.dart';
import 'package:flutter/material.dart';

class PollingConfirm extends StatelessWidget {
  final List<Map<String, String>> candidate;

  const PollingConfirm({super.key, required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Confirm Your Vote',
              style: TextStyle(
                color: Color.fromRGBO(111, 44, 145, 1),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            // Candidate List
            Expanded(
              child: ListView.builder(
                itemCount: candidate.length,
                itemBuilder: (context, index) {
                  final c = candidate[index];
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(20),
                      leading: const Icon(
                        Icons.account_circle,
                        size: 60,
                        color: Color.fromRGBO(111, 44, 145, 1),
                      ),
                      title: Text(
                        c['name'] ?? '',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        c['party'] ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // Submit Button
            SizedBox(
              width:150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PollingVotedone()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: const Color.fromRGBO(111, 44, 145, 1),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Cancel Button
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PollingCandidate()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Color.fromRGBO(111, 44, 145, 1)),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Color.fromRGBO(111, 44, 145, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
