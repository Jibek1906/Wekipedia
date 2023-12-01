import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 157, 226, 192),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            //site name
            Text(
              "Dogkipedia",
              style: GoogleFonts.archivoBlack(
                color: Colors.white,
                fontSize: 30,
              ),
            ),

            const SizedBox(height: 28),

            //icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: SizedBox(
                width: 250,
                height: 250,
                child: Image.asset('lib/images/happy.png'),
              ),
            ),

            //title

            //subtitle

            //start button
          ],
        ),
      ),
    );
  }
}
