import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/dog.dart';

class DogTile extends StatelessWidget {
  final Dog dog;
  final void Function()? onTap;

  const DogTile({
    super.key,
    required this.dog,
    required this.onTap,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 157, 226, 192),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              dog.imagePath,
              height: 120,
            ),
      
            Text(
              dog.name,
              style: GoogleFonts.archivoBlack(fontSize: 15),
            ),
      
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(dog.type, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ))
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}
