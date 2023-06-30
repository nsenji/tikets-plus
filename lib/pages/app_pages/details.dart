
import 'package:flutter/material.dart';

import 'date_picker.dart';

class MovieDetailsPage extends StatefulWidget {
  String poster;
  String clip;
  String description;
  String duration;
  String genre;
  String title;
  String location;

  MovieDetailsPage(
      {super.key,
      required this.title,
      required this.poster,
      required this.clip,
      required this.description,
      required this.duration,
      required this.genre,
      required this.location
      });

  @override
  // ignore: no_logic_in_create_state
  State<MovieDetailsPage> createState() => _MovieDetailsPageState(
      title: title,
      poster: poster,
      clip: clip,
      description: description,
      duration: duration,
      genre: genre);
}

class _MovieDetailsPageState extends State<MovieDetailsPage>
    with SingleTickerProviderStateMixin {
  _MovieDetailsPageState(
      {required this.title,
      required this.poster,
      required this.clip,
      required this.description,
      required this.duration,
      required this.genre});

  String title;
  String poster;
  String clip;
  String description;
  String duration;
  String genre;

  late AnimationController controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 1000));

  bool isPlaying = false;

  // @override
  // void initState(){
  //   super.initState();

  //   controller = AnimationController(
  //     vsync: this,
  //     duration: const Duration(milliseconds: 1000),
  //     reverseDuration: const Duration(milliseconds: 1000)
  //   );
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  void toggleIcon() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying ? controller.forward() : controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Stack(children: [
        // ...buildBackground(context),
        // THE MOVIE TITLE AND TIME
        Positioned(
            bottom: 300,
            right: 120,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Container(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '2022 | $genre | $duration',
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
            ])),
        // THE POSTER IN THE RIGHT CORNER
        // Positioned(
        //     bottom: 230,
        //     left: 260,
        //     child: SizedBox(
        //       height: 150,
        //       width: 110,
        //       child: Image.asset(
        //         'assets/$poster',
        //         fit: BoxFit.cover,
        //       ),
        //     )),
        // THE PLAY BUTTON
        
        // THE MOVIE DESCRIPTON
        Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 110,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium
              ),
            )),
        // THE BOOK SEAT BUTTON
         Positioned(left: 160, bottom: 50, child: Button(location: widget.location,))
      ]),
    );
  }

  List<Widget> buildBackground(context) {
    return [
      Container(
        height: double.infinity,
      ),
      Image.asset(
        'assets/$clip',
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.cover,
      ),
       Positioned.fill(
          child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Color.fromARGB(255, 27, 28, 32),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.3, 0.5])))),
    ];
  }
}
