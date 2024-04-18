import 'package:shop_ease/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/string_validator.dart';
import 'package:google_fonts/google_fonts.dart';


class SignInAccountPage extends StatefulWidget {
  const SignInAccountPage({Key? key}) : super(key: key);

  @override
  _SignInAccountPageState createState() => _SignInAccountPageState();
}

class _SignInAccountPageState extends State<SignInAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In to your Account',
          style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email Address'),
              keyboardType: TextInputType.emailAddress,
              validator: validateEmailAddress,
            ),
            TextFormField(
              controller: _pwController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: validatePassword,
            ),
            ElevatedButton(
              child:  Text('Login', style: GoogleFonts.montserrat(
              textStyle: TextStyle(
              color: Colors.green,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  String? result = await  AuthController().signIn(email: _emailController.text, password: _pwController.text);


                  // If the result is null, navigate back a page
                  if (result == null) {
                    Navigator.of(context).pop();
                  } else {
                    // Otherwise, show the error message on the screen using _errorMessage
                    setState(() {
                      _errorMessage = result!;
                    });
                  }
                }
              },
            ),
            Text(_errorMessage, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }



}
