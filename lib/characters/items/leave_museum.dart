import 'package:art_gallery/characters/julia.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/pages/exterior_map_leave.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class LeaveMuseum extends GameDecoration with Sensor {
  LeaveMuseum(Vector2 position)
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
            builder: (context) => const ExteriorMapLeave(),
          ),
          (route) => false,
        );
      }
    }
  }
}
