import 'package:cinema_tikets/mapping/mapping.dart';
import 'package:cinema_tikets/pages/app_pages/profile.dart';
import 'package:flutter/material.dart';
import 'movie_card.dart';
import 'package:cinema_tikets/pages/app_pages/coming_soon.dart';

class HomePage extends StatelessWidget {
  final String location;
  const HomePage({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 21, 21),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'SHOWING-$location',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        // iconTheme: const IconThemeData(
        //   color: Colors.black,
        // ),
        actions: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              // border: Border.all(
              //   color: Colors.blue,
              // ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5.0,
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
              child: const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
        // backgroundColor: Styles.primaryColor,
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
                children: acacia
                    .map((singleMovie) => MovieView(
                          acacia: singleMovie,
                          location: location,
                        ))
                    .toList()),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Coming Soon...",
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
                children: acaciaComing
                    .map((movie) => ComingSoon(acaciaComing: movie))
                    .toList()),
          ),
        ],
      ),
    );
  }
}
