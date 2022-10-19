import 'package:cinema_tikets/pages/app_pages/home_page.dart';
import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 21, 21),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: const Alignment(0.0, 1.0),
                        child: CircleAvatar(
                          radius: 60.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/logo.jpg"),
                                fit: BoxFit.cover,
                                repeat: ImageRepeat.noRepeat,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(40),
                  child: Text(
                    "Choose your location",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage(
                                    location: 'ACACIA',
                                  )));
                    },
                    child: Container(
                      height: 150,
                      width: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/acacia_place.jpg"),
                          fit: BoxFit.cover,
                          repeat: ImageRepeat.noRepeat,
                        ),
                        borderRadius: BorderRadius.all(
                             Radius.circular(24),
                          ),
                      ),
                      child: const Center(
                        child: Text("ACACIA",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Positioned(
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage(
                                    location: "METROPLEX NAALYA",
                                  )));
                    },
                    child: Container(
                      height: 150,
                      width: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/metro_place.jpg"),
                          fit: BoxFit.cover,
                          repeat: ImageRepeat.noRepeat,
                        ),
                        borderRadius: BorderRadius.all(
                           Radius.circular(24),
                          ),
                      ),
                      child: const Center(
                        child: Text(
                          "METROPLEX NAALYA",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Positioned(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage(
                                    location: 'ARENA MALL',
                                  )));
                    },
                    child: Container(
                      height: 150,
                      width: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/arena_place.jpg"),
                          fit: BoxFit.cover,
                          repeat: ImageRepeat.noRepeat,
                        ),
                        borderRadius: BorderRadius.all(
                           Radius.circular(24),
                          ),
                      ),
                      child: const Center(
                        child: Text("ARENA MALL",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
