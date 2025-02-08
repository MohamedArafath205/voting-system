import 'package:flutter/material.dart';
import 'login_credentials.dart'; // Import the next screen

class NewMemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Member Registration")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Please enter your information",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // ID Field
              _buildTextField(label: "ID"),

              // Name Field
              _buildTextField(label: "Name"),

              // Age Field
              _buildTextField(label: "Age", keyboardType: TextInputType.number),

              // Gender Field
              _buildTextField(label: "Gender"),

              // Date of Birth Field
              _buildTextField(label: "Date of Birth (DD/MM/YYYY)"),

              SizedBox(height: 40),

              // Next Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginCredentials()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFEA502),
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: Text("Next"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom Input Field Widget
  Widget _buildTextField({required String label, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
