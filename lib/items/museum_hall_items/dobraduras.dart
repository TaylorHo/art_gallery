import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dobraduras extends GameDecoration with TapGesture {
  Dobraduras(Vector2 position)
      : super(position: position, size: Vector2(272, 162));

  @override
  Future<void> onLoad() {
    returnHint(
      context: context,
      target: this,
      name: 'dobraduras',
      offset: const Offset(126, 76),
    );
    return super.onLoad();
  }

  @override
  void onTap() {
    gameRef.player?.stopMoveAlongThePath();
    removeFollower('dobraduras');
    TalkDialog.show(
      context,
      [
        Say(
          text: [
            const TextSpan(
              text:
                  'Além das obras consideradas "comuns", a artista conta com habilidades fascinantes na criação de dobraduras, origamis e outos objetos, como caixinhas com formatos diferentes ou enfeiteis feitos à mão.\n',
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
                  'Qualquer pessoa ficaria extremamente feliz de ganhar uma das caixinhas feitas por você, hihi\nEu sempre guardo, são muito especiais, além de incrivelmente bem feitas.\n',
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
