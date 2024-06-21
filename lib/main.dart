import 'package:flutter/material.dart';
import 'package:lesson61/views/screens/homepage.dart';
import 'package:lesson61/views/screens/homescreen.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
