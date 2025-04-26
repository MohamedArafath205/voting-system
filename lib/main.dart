import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'login_page.dart';
//import 'party_selection_page.dart'; // Create this page if not done yet

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Voting Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,

      // Step 1: Use routes to manage navigation
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        //'/partySelection': (context) => PartySelectionPage(), // target page
      },

      // Step 2: Set splash screen as initial screen
      initialRoute: '/',
    );
  }
}
