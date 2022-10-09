import 'package:cinema_tikets/mapping/mapping.dart';
import 'package:cinema_tikets/pages/app_pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:cinema_tikets/utils/styles.dart';
import 'movie_card.dart';
import 'package:cinema_tikets/pages/app_pages/coming_soon.dart';

class HomePage extends StatelessWidget {
  final String location;
  const HomePage({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(location),
        centerTitle: false,
        elevation: 0.0,
        actions: [
          ElevatedButton.icon(
            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xFFF44336))),
            onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> const Profile()));
          },
            icon: const Icon(Icons.person),
            label: const Text("Profile"),
          ),
        ],
        backgroundColor: Styles.primaryColor,
      ),
      body: ListView(
        children: [
           SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding:  const EdgeInsets.only(left :20),
              child: Row(
                children: acacia.map((singleMovie) => MovieView(acacia:singleMovie)).toList()
              ),
           ),
          const SizedBox(height: 30),
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Coming Soon...", style: Styles.headLineStyle2,),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding:  const EdgeInsets.only(left :20),
            child: Row(
                children: acaciaComing.map((movie) => ComingSoon(acaciaComing:movie)).toList()
            ),
          ),
        ],
      ),
    );
  }
}
