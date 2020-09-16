import 'package:flutter/material.dart';
import 'package:food_app/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200], primaryColor: Colors.amber),
    home: HomeScreen(),
  ));
}
