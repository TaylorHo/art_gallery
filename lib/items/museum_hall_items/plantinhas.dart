import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CanteirosDePlantinhas extends GameDecoration with TapGesture {
  CanteirosDePlantinhas(Vector2 position)
      : super(position: position, size: Vector2(190, 220));

  @override
  Future<void> onLoad() {
    returnHint(
      context: context,
      target: this,
      name: 'canteiros_de_plantinhas',
      offset: const Offset(90, 80),
    );
    return super.onLoad();
  }

  @override
  void onTap() {
    removeFollower('canteiros_de_plantinhas');
    TalkDialog.show(
      context,
      [
        Say(
            text: [
              const TextSpan(
                text:
                    'E aqui estão as plantinhas, sempre muito bem cuidadas, hihi',
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
}
