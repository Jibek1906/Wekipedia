import 'package:dogkipedia/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    // Implement your MenuPage widget here
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(children: [
        Container(  
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 84, 171, 126),
            borderRadius: BorderRadius.circular(20)
          ),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.all(25),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                  'For Dog lovers',
                    style: GoogleFonts.archivoBlack(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                    const SizedBox(height: 20),
                    MyButton(text: 'Sign in', onTap: (){})
                ]
              ),
              
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset('lib/images/smile.png'),
                ),
              ),
            ]
          ),
        )
      ]),
    );
  }
}
