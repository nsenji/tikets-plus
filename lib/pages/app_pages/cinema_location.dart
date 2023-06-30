import 'package:cinema_tikets/pages/app_pages/home_page.dart';
import 'package:flutter/material.dart';

import '../../Custom_widgets/location_widget.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 40,right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    "Choose your location",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const HomePage(location: 'ACACIA')));
                    },
                    child: const LocationCard(
                      locationName: 'ACACIA',
                      image: 'acacia.jpg',
                    )),
                const SizedBox(height: 10),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const HomePage(location: 'METROPLEX')));
                    },
                    child: const LocationCard(
                      locationName: 'METROPLEX',
                      image: 'metro_place.jpg',
                    )),
                const SizedBox(height: 10),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const HomePage(location: 'ARENA MALL')));
                    },
                    child: const LocationCard(
                      locationName: 'ARENA MALL',
                      image: 'arena_place.jpg',
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
