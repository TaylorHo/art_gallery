import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaterialDePintura extends GameDecoration with TapGesture {
  MaterialDePintura(Vector2 position)
      : super(position: position, size: Vector2(36, 40));

  @override
  Future<void> onLoad() {
    returnHint(
      context: context,
      target: this,
      name: 'material_de_pintura',
      offset: const Offset(10, 5),
    );
    return super.onLoad();
  }

  @override
  void onTap() {
    removeFollower('material_de_pintura');
    TalkDialog.show(
      context,
      [
        Say(
            text: [
              const TextSpan(
                text: 'E mais material de pintura, heheh\nQuanto mais, melhor.',
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
