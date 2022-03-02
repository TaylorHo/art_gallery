import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MesinhaDePintura extends GameDecoration with TapGesture {
  MesinhaDePintura(Vector2 position)
      : super(position: position, size: Vector2(80, 60));

  @override
  Future<void> onLoad() {
    returnHint(
      context: context,
      target: this,
      name: 'mesinha_de_pintura',
      offset: const Offset(30, 16),
    );
    return super.onLoad();
  }

  @override
  void onTap() {
    removeFollower('mesinha_de_pintura');
    TalkDialog.show(
      context,
      [
        Say(
            text: [
              const TextSpan(
                text:
                    'Essa é uma mesinha que elas podem usar para explorar sua criatividade.\nVocê pode aproveitar e mostrar pra elas depois como é ser uma artista incrível, hihi',
                style: TextStyle(
                  fontFamily: 'Normal',
                ),
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
