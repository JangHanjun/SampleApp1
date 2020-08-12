import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      home: MyHomePage(),
    );
  }
}

