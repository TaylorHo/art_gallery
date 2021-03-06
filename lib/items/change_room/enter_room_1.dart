import 'package:art_gallery/characters/julia.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/pages/museum_room.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class EnterRoom1 extends GameDecoration with Sensor {
  EnterRoom1(Vector2 position)
      : super(position: position, size: Vector2(tileSize * 4, 10)) {
    setupSensorArea(
        areaSensor: [CollisionArea.rectangle(size: Vector2(tileSize * 4, 10))]);
  }

  @override
  void onContact(GameComponent component) {
    if (!adviceShowed) {
      if (component is CharacterJulia) {
        FollowerWidget.removeAll();
        adviceShowed = true;

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const MuseumRoom(),
          ),
          (route) => false,
        );
      }
    }
  }
}
