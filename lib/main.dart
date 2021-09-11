import 'package:flutter/material.dart';
import 'package:movie_app/screens_layout/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Screens(),
      debugShowCheckedModeBanner: false,
    );
  }
}

