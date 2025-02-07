import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add your widgets here
            Container(
              width: 412,
              height: 917,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
                    left: 42,
                    top: 139,
                    child: SizedBox(
                      width: 327,
                      height: 41,
                      child: Text(
                        'Please enter your information',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 38,
                    top: 198,
                    child: Container(
                      width: 331,
                      height: 49,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(side: BorderSide(width: 2)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 38,
                    top: 281,
                    child: Container(
                      width: 331,
                      height: 48,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(side: BorderSide(width: 2)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 250,
                    top: 750,
                    child: Container(
                      width: 119,
                      height: 49,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFEA502),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 3),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 280,
                    top: 760,
                    child: SizedBox(
                      width: 59,
                      height: 30,
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 54,
                    top: 209,
                    child: SizedBox(
                      width: 57,
                      height: 26,
                      child: Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 52,
                    top: 295,
                    child: SizedBox(
                      width: 150,
                      height: 30,
                      child: Text(
                        'Age',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 38,
                    top: 363,
                    child: Container(
                      width: 331,
                      height: 48,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(side: BorderSide(width: 2)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 49,
                    top: 372,
                    child: SizedBox(
                      width: 150,
                      height: 30,
                      child: Text(
                        'Gender',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 38,
                    top: 449,
                    child: Container(
                      width: 331,
                      height: 48,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(side: BorderSide(width: 2)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 49,
                    top: 458,
                    child: SizedBox(
                      width: 150,
                      height: 30,
                      child: Text(
                        'DD/MM/YYYY',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Add more containers and widgets as needed
          ],
        ),
      ),
    );
  }
}