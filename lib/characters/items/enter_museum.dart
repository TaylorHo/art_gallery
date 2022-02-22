import 'package:art_gallery/characters/julia.dart';
import 'package:art_gallery/main.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

bool adviceShowed = false;

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

        // pode entrar no museu
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                  title: Text('Próximo Nível: Entrar no Museu'));
            });
        adviceShowed = true;
      }
    }
  }
}
