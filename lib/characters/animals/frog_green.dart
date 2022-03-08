import 'package:art_gallery/characters/animals/animals_sprite_sheet.dart';
import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/interact.dart';
import 'package:art_gallery/utils/sounds.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

const String interactName = 'interactSapinhoVerde';
bool alreaddyTapped = false;

class AnimalFrogGreen extends GameDecoration with ObjectCollision, TapGesture {
  AnimalFrogGreen(Vector2 position)
      : super.withAnimation(
            position: position,
            size: Vector2(tileSize, tileSize),
            animation: FrogGreenSpriteSheet.froguinho) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: Vector2(24, 24), align: Vector2(12, 12))
    ]));
  }

  @override
  void onTap() {
    gameRef.player?.stopMoveAlongThePath();
    if (!alreaddyTapped) {
      saveInteractedItem(interactName);
    }
    Sounds.interaction();
    TalkDialog.show(
      context,
      [
        Say(
            text: [
              const TextSpan(
                text: 'Sapinho Verde <3 <3 <3',
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
      ],
      onFinish: () {
        alreaddyTapped = true;
      },
    );
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Vector2 position) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
}
