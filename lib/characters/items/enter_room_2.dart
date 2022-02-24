import 'package:art_gallery/characters/julia.dart';
import 'package:art_gallery/main.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class EnterRoom2 extends GameDecoration with Sensor {
  EnterRoom2(Vector2 position)
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

        showDialog(
            context: context,
            builder: (context) {
              return const Text('Próxima Sala');
            });
      }
    }
  }
}
