import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MovieCard extends StatefulWidget {
  final String image;
  const MovieCard({super.key, required this.image});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.asset(
        widget.image,
        fit: BoxFit.contain,
      ),
    );
  }
}
