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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'SHOWING-$location',
        ),
        centerTitle: false,
        elevation: 0.0,
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
                  style: TextStyle(fontSize: 23),
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
