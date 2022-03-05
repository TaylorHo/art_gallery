import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlorzinhasNoMuseu extends GameDecoration with TapGesture, Sensor {
  String flowerID;
  FlorzinhasNoMuseu(Vector2 position, this.flowerID)
      : super(position: position, size: Vector2(76, 76)) {
    setupSensorArea(
        areaSensor: [CollisionArea.rectangle(size: Vector2(76, 76))]);
  }

  @override
  Future<void> onLoad() {
    returnHint(
      context: context,
      target: this,
      name: 'florzinha_' + flowerID,
      offset: const Offset(30, 26),
    );
    return super.onLoad();
  }

  @override
  void onTap() {
    gameRef.player?.stopMoveAlongThePath();
    removeFollower('florzinha_1');
    removeFollower('florzinha_2');
    TalkDialog.show(
      context,
      [
        Say(
            text: [
              const TextSpan(
                text: 'Texto',
              ),
            ],
            person: SizedBox(
              child: TaylorSpriteSheet.idleRight.asWidget(),
              height: 150,
              width: 100,
            ),
            speed: saySpeed),
      ],
      logicalKeyboardKeysToNext: [
        LogicalKeyboardKey.space,
        LogicalKeyboardKey.enter
      ],
    );
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Vector2 position) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}

  @override
  void onContact(GameComponent component) {}
}
