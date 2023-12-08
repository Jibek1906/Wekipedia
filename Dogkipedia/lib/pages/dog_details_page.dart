import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/dog.dart';

class DogDetailsPage extends StatefulWidget {
  final Dog dog;
  const DogDetailsPage({super.key, required this.dog});

  @override
  State<DogDetailsPage> createState() => _DogDetailsPageState();
}

class _DogDetailsPageState extends State<DogDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 157, 226, 192),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: ListView(
              children: [
                Image.asset(
                  widget.dog.imagePath,
                  height: 200,
                ),
                const SizedBox(height: 20),
                Text(
                  widget.dog.name,
                  style: GoogleFonts.archivoBlack(
                      color: Color.fromARGB(255, 22, 105, 72),
                      fontSize: 24)
                ),
                const SizedBox(height: 20),
                Text("Description",style:GoogleFonts.archivoBlack(
                  color: Color.fromARGB(245, 63, 164, 122),
                  fontSize: 19,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                    widget.dog.description,
                    style: GoogleFonts.archivoBlack(
                        color: Colors.white,
                        fontSize: 18
                    ),
                )


                // const SizedBox(height: 10)
                // Text("French Bulldogs are small, affectionate dogs with a distinctive appearance, known for their friendly nature and adaptability to different living spaces.",
                // style: TextStyle(
                //   color:Colors.blueGrey,
                //   fontSize: 15,
                //   height: 2
                //   ),
                // ),

              ],
            ),
          ))
        ],
      ),
    );
  }
}
