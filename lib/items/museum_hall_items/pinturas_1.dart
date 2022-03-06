import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pinturas1 extends GameDecoration with TapGesture {
  Pinturas1(Vector2 position)
      : super(position: position, size: Vector2(158, 168));

  @override
  Future<void> onLoad() {
    returnHint(
      context: context,
      target: this,
      name: 'pinturas_1',
      offset: const Offset(66, 72),
    );
    return super.onLoad();
  }

  @override
  void onTap() {
    gameRef.player?.stopMoveAlongThePath();
    removeFollower('pinturas_1');
    TalkDialog.show(
      context,
      [
        Say(
          text: [
            const TextSpan(
              text:
                  'Para uma artista versada em diversas formas de expressão, pinturas não poderiam faltar.',
              style: TextStyle(fontStyle: FontStyle.italic),
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
                  'Diversas obras compõe seu acervo, muitas pouco mostradas ao público em geral, apesar de serem muito bem feitas.\n',
              style: TextStyle(fontStyle: FontStyle.italic),
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
              text: 'Um talento sem igual, heheh\n',
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
