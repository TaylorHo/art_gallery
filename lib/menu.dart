import 'package:art_gallery/pages/exterior_map.dart';
import 'package:art_gallery/pages/hall_map.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              "Julia's Art Gallery",
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
            const SizedBox(
              height: 28.0,
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('images/load.png'),
            ),
            const SizedBox(
              height: 34.0,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  minimumSize: const Size(100, 40),
                ),
                child: const Text(
                  'Jogar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MuseumHallMap(
                        mapPositionInInit: true,
                        positionInEntrance: true,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 20,
          margin: const EdgeInsets.all(20.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text(
                      'Desenvolvido com amor pelo seu Amor <3',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text(
                      'Explore em busca do prêmio final',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
