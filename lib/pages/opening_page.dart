import 'package:flutter/material.dart';
import 'create_account_page.dart';
import 'sign_in_account_page.dart';
import 'package:google_fonts/google_fonts.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.green, // Set the color of the panel to green
            height: 70,
            width: double.infinity, // Make the panel full width
          ),
          SizedBox(height: 30.0), // Adding some space between the panel and the title
          Text(
            'Welcome to ScienceStudyPro!', // Title text
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
    SizedBox(height: 16.0), // Adding some space between the panel and the image
    SizedBox(
    height: 400, // Adjust the height of the image
    width: 400, // Adjust the width of the image
    child: Image(
    image: AssetImage('assets/photo/studyapp.png'),
    fit: BoxFit.cover,
    ),
    ),
          SizedBox(height: 16.0), // Adding some space between the image and the buttons
          ElevatedButton(
            onPressed: () {
              //navigating to create page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateAccountPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green, // Set the background color to green
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0), // Adjust the padding to make the button bigger
            ),
            child: Text(
              'Create Account',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0), // Adding some space between the buttons
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInAccountPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green, // Set the background color to green
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0), // Adjust the padding to make the button bigger
            ),
            child: Text(
              'Sign In',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
