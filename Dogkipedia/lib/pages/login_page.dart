import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dogkipedia/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  // text editing controller
  static final usernameController = TextEditingController();
  static final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 203, 180),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),

              // logo
              Icon(
                Icons.lock,
                size: 100,
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

              // forgot password?
             Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
                 child:  Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Text(
                       'Forgot Password?',
                       style: TextStyle(color: Colors.white),
                     ),
                   ],
                 ),
             ),

              const SizedBox(height: 25),
              

              // sign in

              // register now
            ],
          ),
        ),
      ),
    );
  }
}