import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SapinhosNoLaguinho extends GameDecoration with TapGesture {
  SapinhosNoLaguinho(Vector2 position)
      : super(position: position, size: Vector2(300, 360));

  @override
  Future<void> onLoad() {
    returnHint(
      context: context,
      target: this,
      name: 'sapinhos',
      offset: const Offset(140, 155),
    );
    return super.onLoad();
  }

  @override
  void onTap() {
    removeFollower('sapinhos');
    TalkDialog.show(
      context,
      [
        Say(
          text: [
            const TextSpan(
              text: 'Mais Sapinhos.\n',
            ),
          ],
          person: SizedBox(
            child: TaylorSpriteSheet.idleRight.asWidget(),
            height: 150,
            width: 100,
          ),
          speed: saySpeed,
        ),
        Say(
          text: [
            const TextSpan(
              text:
                  'Eles não são uma forma de expressão, arte criada por você, nem nada desse tipo.\nMas vc ama sapinhos, então óbvio que teriam mais alguns aqui <3',
            ),
          ],
          person: SizedBox(
            child: TaylorSpriteSheet.idleRight.asWidget(),
            height: 150,
            width: 100,
          ),
          speed: saySpeed,
        ),
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
