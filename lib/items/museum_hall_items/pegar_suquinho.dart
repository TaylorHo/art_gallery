import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:art_gallery/utils/interact.dart';

import 'package:art_gallery/utils/sounds.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String interactName = 'interactPegarSuquinho';
bool alreaddyTapped = false;

class PegarSuquinho extends GameDecoration with TapGesture {
  PegarSuquinho(Vector2 position)
      : super(position: position, size: Vector2(72, 132));

  @override
  Future<void> onLoad() async {
    bool alreadyInteracted = await returnInteractedItem(interactName);
    if (alreadyInteracted) {
      alreaddyTapped = true;
    } else {
      returnHint(
        context: context,
        target: this,
        name: 'pegar_suquinho',
        offset: const Offset(28, 20),
      );
    }
    return super.onLoad();
  }

  @override
  void onTap() {
    gameRef.player?.stopMoveAlongThePath();

    Sounds.interaction();
    TalkDialog.show(
      context,
      [
        Say(
          text: [
            const TextSpan(
              text: 'Máquina de pegar bebidas, yayy\n',
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
                  'Pode escolher o que quiser, tem de tudo aqui. Eu vou pegar um suquinho (cheio de açúcar, me deixa)\n',
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
        if (!alreaddyTapped) {
          removeFollower('pegar_suquinho');
          saveInteractedItem(interactName);
          alreaddyTapped = true;
        }
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
