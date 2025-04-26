import 'package:flutter/material.dart';
import 'login_credentials.dart';

class NewMemberPage extends StatefulWidget {
  @override
  _NewMemberPageState createState() => _NewMemberPageState();
}

class _NewMemberPageState extends State<NewMemberPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    ageController.dispose();
    genderController.dispose();
    dobController.dispose();
    super.dispose();
  }

  // Date Picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Member Registration")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
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

                // Fields with validation
                _buildTextField(
                  label: "ID",
                  controller: idController,
                  validator: (value) =>
                  value == null || value.isEmpty ? "ID is required" : null,
                ),
                _buildTextField(
                  label: "Name",
                  controller: nameController,
                  validator: (value) =>
                  value == null || value.isEmpty ? "Name is required" : null,
                ),
                _buildTextField(
                  label: "Age",
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Age is required";
                    final age = int.tryParse(value);
                    if (age == null || age <= 0) return "Enter a valid age";
                    return null;
                  },
                ),
                _buildTextField(
                  label: "Gender",
                  controller: genderController,
                  validator: (value) =>
                  value == null || value.isEmpty ? "Gender is required" : null,
                ),

                // DOB with Date Picker
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: _buildTextField(
                      label: "Date of Birth",
                      controller: dobController,
                      validator: (value) =>
                      value == null || value.isEmpty ? "DOB is required" : null,
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // Next Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginCredentials()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFEA502),
                      foregroundColor: Colors.black,
                      padding:
                      EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      textStyle: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: Text("Next"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
