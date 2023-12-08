import 'package:Dogkipedia/components/button.dart';
import 'package:Dogkipedia/models/dog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/dog_tile.dart';
import 'dog_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>{
  TextEditingController searchController = TextEditingController();
  List<Dog> filteredDogs = [];
  @override
  void initState() {
    super.initState();
    filteredDogs = List.from(dogBreed); // Initialize with the entire list
  }
  List<Dog> dogBreed = [
    Dog(name: "French Bulldog", type: "Companion", imagePath: "lib/images/french_bulldog.png",
        description: 'French Bulldogs are small, affectionate dogs with a distinctive appearance, known for their friendly nature and adaptability to different living spaces.\n\n'
                    'Size: small\nCoat: short, smooth\nAverage sizes and life expectancy: about 30 cm, up to 12 kg, 10-12 years'),
    Dog(name: "Welsh Corgi", type: "Companion", imagePath: "lib/images/welsh_corgi.png", description: 'Welsh Corgis, characterized by their short legs and long bodies, are spirited and affectionate companions, renowned for their intelligence and herding instincts.\n\n'
              'Size: small\nCoat: short, double\nAverage sizes and life expectancy: 25-30 cm, up to 13 kg, 12-13 years'),
    Dog(name: "Pomeranian", type: "Toy dog", imagePath: "lib/images/pomeranian.png", description: 'Pomeranians are delightful dogs with vibrant personalities. These small yet confident companions are known for their alertness, intelligence, and affectionate nature.\n\n'
              'Size: small\nCoat: long, fluffy\nAverage sizes and life expectancy: 15-18 cm, 1-3 kg, 12-16 years'),
    Dog(name: "Husky", type: "Working", imagePath: "lib/images/smile.png", description: 'Huskies are majestic dogs recognized for their striking appearance with thick fur and distinctive markings. Known for their friendly and outgoing nature, Huskies are intelligent, energetic.\n\n'
              'Size: medium\nCoat: medium, double\nAverage sizes and life expectancy: 50-60 cm, 15-25 kg, 12-14 years'),
    Dog(name: "Shiba Inu", type: "Hound", imagePath: "lib/images/happy.png", description: 'Shiba Inus are compact dogs known for their spirited personality and fox-like appearance. With a curled tail and a confident demeanor, Shiba Inus are a Japanese breed renowned for their intelligence, independence, and loyalty.\n\n'
              'Size: medium\nCoat: short, double\nAverage sizes and life expectancy: 35-45 cm, 7-10 kg, 13-16 years'),
    Dog(name: "German Shepherd", type: "Working", imagePath: 'lib/images/german_shepherd.png', description: "German Shepherds are versatile, intelligent dogs known for their loyalty and courage, they excel in various roles, including as police and service dogs. They are admired for their protective nature and trainability.\n\n"
              'Size: medium/large\nCoat: medium, double\nAverage sizes and life expectancy: 55-65 cm, 20-40 kg, 7-10 years')
  ];


  void navigateToDogDetails(int index){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DogDetailsPage(
      dog: dogBreed[index],
      ),
    ));
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Color.fromARGB(255, 10, 72, 49),
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
            padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
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
              child: TextField(
                controller: searchController,
                onChanged: (query){
                  filterDogs(query);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 157, 226, 192)),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 157, 226, 192)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  hintText: "Search here..",

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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.5,
              ),
              itemCount: filteredDogs.length,
              itemBuilder: (context, index) => DogTile(
                dog: filteredDogs [index],
                onTap: () => navigateToDogDetails(index),
              ),
            )
          ),

        ],
      )
    );
  }

  void filterDogs(String query) {
    setState(() {
      if (query.isEmpty) {
        // If the query is empty, show the entire list
        filteredDogs = List.from(dogBreed);
      } else {
        // Filter the list based on the query
        filteredDogs = dogBreed.where((dog) =>
            dog.name.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }
}
