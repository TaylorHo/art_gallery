import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrinquedosSeparados extends GameDecoration with TapGesture {
  BrinquedosSeparados(Vector2 position)
      : super(position: position, size: Vector2(256, 68));

  @override
  Future<void> onLoad() {
    returnHint(
      context: context,
      target: this,
      name: 'brinquedos_separados',
      offset: const Offset(121, -10),
    );
    return super.onLoad();
  }

  @override
  void onTap() {
    gameRef.player?.stopMoveAlongThePath();
    removeFollower('brinquedos_separados');
    TalkDialog.show(
      context,
      [
        Say(
          text: [
            const TextSpan(
              text:
                  'Brinquedos não poderiam faltar. Ser artista é se divertir no processo, mas descansar um pouco sempre faz bem, e eles precisam aprender isso desde cedo.',
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
