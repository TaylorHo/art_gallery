import 'package:art_gallery/characters/julia.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/pages/hall_map.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class EnterMuseum extends GameDecoration with Sensor {
  EnterMuseum(Vector2 position)
      : super(position: position, size: Vector2(tileSize * 8, 32)) {
    setupSensorArea(
        areaSensor: [CollisionArea.rectangle(size: Vector2(tileSize * 8, 32))]);
  }

  @override
  void onContact(GameComponent component) {
    if (!adviceShowed) {
      if (component is CharacterJulia) {
        FollowerWidget.removeAll();
        adviceShowed = true;

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const MuseumHallMap(mapPositionInInit: true),
          ),
          (route) => false,
        );
      }
    }
  }
}
