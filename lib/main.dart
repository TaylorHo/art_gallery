import 'package:art_gallery/pages/exterior_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

double tileSize = 48;
bool adviceShowed = false;
int saySpeed = 18;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    return const MaterialApp(
      title: 'Julia\'s Art Gallery',
      home: ExteriorMap(),
    );
  }
}
