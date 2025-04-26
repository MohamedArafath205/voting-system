import 'package:flutter/material.dart';
import 'confirm_voting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VotingPage(),
    );
  }
}

class VotingPage extends StatelessWidget {
  final List<Map<String, String>> parties = [
    {
      'partyName': 'Party A',
      'partyLogo': 'assets/Ant.jpg',
      'leaderName': 'Leader A',
      'leaderAge': '45',
      'description': 'Party A focuses on innovation and technology.',
      'about': 'Party A has led major tech reforms since 2010. Leader A is a former software engineer turned politician.'
    },
    {
      'partyName': 'Party B',
      'partyLogo': 'assets/Ara.jpg',
      'leaderName': 'Leader B',
      'leaderAge': '50',
      'description': 'Party B advocates for environmental sustainability.',
      'about': 'Party B introduced green energy policies. Leader B has 20 years of experience in environmental activism.'
    },
    {
      'partyName': 'Party C',
      'partyLogo': 'assets/Hari.jpg',
      'leaderName': 'Leader C',
      'leaderAge': '40',
      'description': 'Party C focuses on economic growth.',
      'about': 'Party C reduced unemployment by 30%. Leader C is an economist with a focus on startup culture.'
    },
    {
      'partyName': 'Party D',
      'partyLogo': 'assets/Karan.jpg',
      'leaderName': 'Leader D',
      'leaderAge': '55',
      'description': 'Party D prioritizes social welfare and healthcare.',
      'about': 'Party D launched major healthcare schemes. Leader D has been active in humanitarian efforts for 25 years.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voting Page'),
        backgroundColor: Color(0xFFFEA502),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.68,
          ),
          itemCount: parties.length,
          itemBuilder: (context, index) {
            final party = parties[index];
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(party['partyName']!),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(party['partyLogo']!),
                        ),
                        SizedBox(height: 10),
                        Text('Leader: ${party['leaderName']}'),
                        Text('Age: ${party['leaderAge']}'),
                        SizedBox(height: 8),
                        Text('Description: ${party['description']}'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmVotingPage(
                                partyName: party['partyName']!,
                                leaderName: party['leaderName']!,
                                leaderAge: party['leaderAge']!,
                                partyLogo: party['partyLogo']!,
                                description: party['description']!,
                                about: party['about']!,
                              ),
                            ),
                          );
                        },
                        child: Text('VOTE'),
                      ),
                    ],
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        party['partyName']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          party['partyLogo']!,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Leader: ${party['leaderName']}'),
                      Text('Age: ${party['leaderAge']}'),
                      SizedBox(height: 6),
                      Text(
                        party['description']!,
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
