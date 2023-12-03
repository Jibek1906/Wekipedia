import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

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
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 25),

              // username
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                 decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 189, 229, 201),)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(
                        255, 117, 155, 118))
                    ),
                   fillColor: Color.fromARGB(255, 189, 229, 201),
                   
                   filled: true,
                  ),
                ),
              ),
              // password

              // forgot password?

              // sign in

              // register now
            ],
          ),
        ),
      ),
    );
  }
}
