import 'package:art_gallery/menu.dart';
import 'package:art_gallery/utils/interact.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

double tileSize = 48;
bool adviceShowed = false;
bool museumIntroShowed = false;
int saySpeed = 18;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }
  await getInteractedItems();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Julia\'s Art Gallery',
      debugShowCheckedModeBanner: false,
      home: Menu(),
    );
  }
}
