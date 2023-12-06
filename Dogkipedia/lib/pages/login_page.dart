import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Dogkipedia/components/my_textfield.dart';
import 'package:Dogkipedia/components/sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Dogkipedia/pages/intro_page.dart';
import 'package:Dogkipedia/pages/menu_page.dart';

class LoginPage extends StatelessWidget {
  static final TextEditingController usernameController = TextEditingController();
  static final TextEditingController passwordController = TextEditingController();

  Future<void> signUserIn(BuildContext context) async {
    final username = LoginPage.usernameController.text;
    final password = LoginPage.passwordController.text;

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8888/authentication.php'),
        body: {
          'action': 'login',
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        if (response.body == 'success') {
          // Login successful, navigate to the next page
          Navigator.pushReplacementNamed(context, '/intropage');
        } else {
          // Login failed, show an error message
          _showErrorDialog(context, 'Login failed. Please check your username and password.');
        }
      } else {
        // Handle other HTTP status codes
        _showErrorDialog(context, 'Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      _showErrorDialog(context, 'Error: $error');
    }
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 203, 180),
      body: SafeArea(
        child: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),

                // logo
                Icon(
                  Icons.lock,
                  size: 200,
                ),

                const SizedBox(height: 50),
                // welcome
                Text(
                  "Welcome to Dogkipedia",
                  style: GoogleFonts.archivoBlack(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),

                const SizedBox(height: 25),

                // username
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                // password
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // sign in
                MyButton(
                  onTap: () => signUserIn(context),
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
