import 'package:art_gallery/characters/animals/animals_sprite_sheet.dart';
import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class AnimalFrogYellow extends GameDecoration with ObjectCollision, TapGesture {
  AnimalFrogYellow(Vector2 position)
      : super.withAnimation(
            position: position,
            size: Vector2(tileSize, tileSize),
            animation: FrogYellowSpriteSheet.froguinho) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: Vector2(24, 24), align: Vector2(12, 12))
    ]));
  }

  @override
  void onTap() {
    TalkDialog.show(context, [
      Say(
          text: [
            const TextSpan(
              text: 'Sapinho Amarelo <3 <3 <3',
              style: TextStyle(
                fontFamily: 'Normal',
              ),
            ),
          ],
          speed: saySpeed,
          person: SizedBox(
            child: JuliaSpriteSheet.idleRight.asWidget(),
            width: 100,
            height: 150,
          )),
    ]);
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Vector2 position) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
}
