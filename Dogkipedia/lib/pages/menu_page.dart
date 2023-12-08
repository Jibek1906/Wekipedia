import 'package:Dogkipedia/components/button.dart';
import 'package:Dogkipedia/models/dog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/dog_tile.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>{
  List dogBreed = [
    Dog(name: "French Bulldog", type: "Companion", imagePath: "lib/images/french_bulldog.png"),
    Dog(name: "Welsh Corgi", type: "Companion", imagePath: "lib/images/welsh_corgi.png"),
    Dog(name: "Pomeranian", type: "Toy dog", imagePath: "lib/images/pomeranian.png"),
    Dog(name: "Husky", type: "Working", imagePath: "lib/images/smile.png"),
    Dog(name: "Shiba Inu", type: "Hound", imagePath: "lib/images/happy.png"),
  ];

  @override
  Widget build(BuildContext) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.menu,
            color: Color.fromARGB(255, 84, 171, 126),
          ),
          title: Text('Dogkipedia', style: GoogleFonts.archivoBlack(
              fontSize: 25,
              color: Color.fromARGB(255, 10, 72, 49))),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 157, 226, 192),
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.symmetric(vertical: 25,horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('For Dog lovers', style: GoogleFonts.archivoBlack(
                          fontSize: 19,
                          color: Colors.white)
                      ),
                      const SizedBox(height:20),
                      MyButton(
                        text: "Sign in",
                        onTap: () {
                          Navigator.pushNamed(context, '/loginpage');
                        },
                      )
                    ],
                  ),
                  Image.asset(
                      'lib/images/smile.png',
                      height:100
                  )
                ],
              ),
            ),
            const SizedBox(height:25),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
              child:
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 157, 226, 192)),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 157, 226, 192)),
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
            ),

            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Text('Dog breeds', style: GoogleFonts.archivoBlack(
                  fontSize: 19,
                  color: Colors.black)
              ),
            ),
            const SizedBox(height:10),

            Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.75
                  ),
                  itemCount: dogBreed.length,
                  itemBuilder: (context, index) => DogTile(
                      dog: dogBreed [index]
                  ),
                )
            ),

          ],
        )
    );
  }
}