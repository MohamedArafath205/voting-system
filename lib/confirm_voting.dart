import 'package:flutter/material.dart';
import 'dart:async';
import 'package:local_auth/local_auth.dart';

class ConfirmVotingPage extends StatefulWidget {
  final String partyName;
  final String leaderName;
  final String description;
  final String partyLogo;

  ConfirmVotingPage({
    required this.partyName,
    required this.leaderName,
    required this.description,
    required this.partyLogo,
  });

  @override
  State<ConfirmVotingPage> createState() => _ConfirmVotingPageState();
}

class _ConfirmVotingPageState extends State<ConfirmVotingPage> {
  // biometric vars
  late final LocalAuthentication auth;

  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
        (bool isSupported) => setState((){
          _supportState = isSupported;
        })
    );
  } 

  void authenticate(BuildContext context) async {
  try {
    bool isAuthenticated = await auth.authenticate(
      localizedReason: 'Please authenticate to continue',
      options: const AuthenticationOptions(
        biometricOnly: true,
        stickyAuth: true,
        useErrorDialogs: true,
      ),
    );

    if (isAuthenticated) {
      // Authentication successful
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Authentication successful!')),
      );
    } else {
      // Authentication failed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Authentication failed')),
      );
    }
  } catch (e) {
    // Error occurred during authentication
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Vote'),
        backgroundColor: Color(0xFFFEA502),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Are you sure you want to vote for:',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.partyLogo,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.partyName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Leader: ${widget.leaderName}',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => authenticate(context),
                child: Text('Confirm Vote'),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                ),
                child: Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
