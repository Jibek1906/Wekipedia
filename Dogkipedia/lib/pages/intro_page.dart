import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 157, 226, 192),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
        children: [
          const SizedBox(height: 30,),
          //site name
          Text(
            "Dogkipedia",
              style: GoogleFonts.archivoBlack(
                color: Colors.white,
                fontSize: 30,
              ),
            ),

          const SizedBox(height: 28,),
          
          //icon
          
          //title
          
          //subtitle
          
          //start button
         ],
        ),
       ),
     );
   }
}