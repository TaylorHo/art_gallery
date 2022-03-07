import 'package:art_gallery/characters/animals/animals_sprite_sheet.dart';
import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

const String interactName = 'interactBorboleta';

class AnimalButterfly extends SimpleEnemy
    with ObjectCollision, AutomaticRandomMovement, TapGesture {
  AnimalButterfly(Vector2 position)
      : super(
            position: position,
            size: Vector2(tileSize, tileSize),
            animation: SimpleDirectionAnimation(
                idleRight: ButterflySpriteSheet.idleRight,
                idleLeft: ButterflySpriteSheet.idleLeft,
                runRight: ButterflySpriteSheet.runRight,
                runLeft: ButterflySpriteSheet.runLeft)) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: Vector2(18, 18), align: Vector2(13, 20))
    ]));
  }

  @override
  void update(double dt) {
    runRandomMovement(dt, maxDistance: 1000, speed: 40);
    super.update(dt);
  }

  @override
  void onTap() {
    gameRef.player?.stopMoveAlongThePath();
    TalkDialog.show(context, [
      Say(
          text: [
            const TextSpan(
              text: 'Borboleta <3 <3 <3',
            ),
          ],
          speed: saySpeed,
          boxDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.65),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
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
