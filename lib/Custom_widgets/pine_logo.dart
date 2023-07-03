import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Pine extends StatelessWidget {
  const Pine({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Pine.',
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontFamily: 'Montserrat',
        fontSize: 24
      ),
    );
  }
}
