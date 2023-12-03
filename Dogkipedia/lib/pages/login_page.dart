import 'package:flutter/material.dart';

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

              // welcome

              // username

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
