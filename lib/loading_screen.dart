import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate a loading delay before navigating to the VotingPage
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context); // Pop the loading screen
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset('assets/Vote_Loading.json', width: 400, height: 400), // Lottie animation
      ),
    );
  }
}
