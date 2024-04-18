import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/string_validator.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  String _errorMessage = '';

  TextEditingController myinput = TextEditingController();
  @override
  void initState() {
    myinput.text = ""; //innitail value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
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
              child: Text(
                'Create Account',
                style: TextStyle( // Set the style for the button text
                  color: Colors.green, // Set the text color to green
                  fontSize: 20,
                ),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  String? result = await _createAccount();
                  if (result == null) {
                    Navigator.of(context).pop();
                  } else {
                    setState(() {
                      _errorMessage = result;
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

  Future<String?> _createAccount() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _pwController.text.trim());

      // Account creation successful
      print('Account created: ${userCredential.user?.email}');

      // TODO: Add any additional logic here if needed

      // Return null to indicate success
      return null;
    } catch (e) {
      // Return the error message in case of an error
      return 'Error creating account: $e';
    }
  }


  @override
  void dispose()
  {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

}
