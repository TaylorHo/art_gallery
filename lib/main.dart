import 'package:art_gallery/pages/exterior_map.dart';
import 'package:flutter/material.dart';

double tileSize = 48;
int saySpeed = 18;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: ExteriorMap(),
    );
  }
}