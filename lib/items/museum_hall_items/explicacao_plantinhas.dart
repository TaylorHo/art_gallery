import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:art_gallery/utils/interact.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String interactName = 'interactExplicacaoPlantinhas';
bool alreaddyTapped = false;

class ExplicacaoPlantinhas extends GameDecoration with TapGesture {
  ExplicacaoPlantinhas(Vector2 position)
      : super(position: position, size: Vector2(46, 36));

  @override
  Future<void> onLoad() async {
    bool alreadyInteracted = await returnInteractedItem(interactName);
    if (alreadyInteracted) {
      alreaddyTapped = true;
    } else {
      returnHint(
        context: context,
        target: this,
        name: 'explicacao_plantinhas',
        offset: const Offset(14, -10),
      );
    }
    return super.onLoad();
  }

  @override
  void onTap() {
    gameRef.player?.stopMoveAlongThePath();
    if (!alreaddyTapped) {
      removeFollower('explicacao_plantinhas');
      saveInteractedItem(interactName);
    }
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
          boxDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.65),
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
                  'Você sempre amou plantinhas, e admiro muito isso! Faz parte de quem você é, faz parte da sua arte e faz parte da sua essência.',
            ),
          ],
          person: SizedBox(
            child: TaylorSpriteSheet.idleRight.asWidget(),
            height: 150,
            width: 100,
          ),
          speed: saySpeed,
          boxDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.65),
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
      onFinish: () {
        alreaddyTapped = true;
      },
    );
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Vector2 position) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
}
