import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrincipalObra extends GameDecoration with TapGesture {
  PrincipalObra(Vector2 position)
      : super(position: position, size: Vector2(82, 72));

  @override
  Future<void> onLoad() {
    returnHint(
      context: context,
      target: this,
      name: 'principal_obra',
      offset: const Offset(34, -20),
    );
    return super.onLoad();
  }

  @override
  void onTap() {
    gameRef.player?.stopMoveAlongThePath();
    removeFollower('principal_obra');
    TalkDialog.show(
      context,
      [
        Say(
          text: [
            const TextSpan(
              text:
                  'Esta pode ser considerada a obra mais marcante da artista. Mais de 10 horas de desenho digital, porém ainda inacabada. Quando será que vamos ver a obra pronta?',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
          person: SizedBox(
            child: TaylorSpriteSheet.idleRight.asWidget(),
            height: 150,
            width: 100,
          ),
          speed: saySpeed,
          boxDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.75),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        Say(
          text: [
            const TextSpan(
              text:
                  'De toda forma, o traço é muito bem definido, com fios de cabelo feitos um a um, além de uma riqueza de detalhes impressionante. Não sei você, mas espero um dia ver esta obra concluída.',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
          person: SizedBox(
            child: TaylorSpriteSheet.idleRight.asWidget(),
            height: 150,
            width: 100,
          ),
          speed: saySpeed,
          boxDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.75),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
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
