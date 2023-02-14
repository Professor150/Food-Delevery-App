import 'package:flutter/material.dart';
import 'package:food_delevery/data/data.dart';
import 'package:food_delevery/model/resturant.dart';

import 'package:food_delevery/screen/homepage.dart';

void main() => runApp(FoodDeleveryApp());

class FoodDeleveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        canvasColor: Colors.grey.shade100,
        accentColor: Colors.amber,
      ),
      home: Homepage(),
    );
  }
}
