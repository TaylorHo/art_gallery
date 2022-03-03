import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExplicacaoPlantinhas extends GameDecoration with TapGesture {
  ExplicacaoPlantinhas(Vector2 position)
      : super(position: position, size: Vector2(46, 36));

  @override
  Future<void> onLoad() {
    returnHint(
      context: context,
      target: this,
      name: 'explicacao_plantinhas',
      offset: const Offset(14, -10),
    );
    return super.onLoad();
  }

  @override
  void onTap() {
    removeFollower('explicacao_plantinhas');
    TalkDialog.show(
      context,
      [
        Say(
          text: [
            const TextSpan(
              text: 'E aqui tem plantinhas.',
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
                  'Você sempre amou plantinhas, e admiro muito isso! Faz parte de quem você é, faz parte da sua arte e faz parte da sua essência.',
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
