import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'loading_screen.dart';  // <-- Add this import statement
import 'voting_page.dart'; // Import the VotingPage

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ongoing Elections"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ongoing Elections",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            _buildElectionCard(
              "Presidential Election 2025",
              "Election for the President of the country. Candidates are running for the highest office.",
              "Starts on May 1, 2025",
              context,
            ),
            SizedBox(height: 20),
            _buildElectionCard(
              "Parliamentary Election 2025",
              "Election for the members of parliament. Vote for your preferred candidate.",
              "Starts on May 5, 2025",
              context,
            ),
            SizedBox(height: 20),
            _buildElectionCard(
              "State Election 2025",
              "Election for the state leaders and parliament members. Make your vote count.",
              "Starts on June 1, 2025",
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildElectionCard(String title, String description, String date, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoadingScreen()), // Navigate to loading screen
        ).then((_) {
          // After loading screen, navigate to VotingPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VotingPage()),
          );
        });
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              Text(
                date,
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
