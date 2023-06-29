import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LocationCard extends StatelessWidget {
  final String image;
  final String locationName;
  const LocationCard({
    super.key,
    required this.locationName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      // shadowColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage("assets/$image"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: Text("$locationName",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
          ),
        ),
      ),
    );
  }

   
}

