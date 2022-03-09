import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:art_gallery/utils/interact.dart';

import 'package:art_gallery/utils/sounds.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String interactName = 'interactBiblioteca';
bool alreaddyTapped = false;

class BibliotecaComLivros extends GameDecoration with TapGesture {
  BibliotecaComLivros(Vector2 position)
      : super(position: position, size: Vector2(254, 180));

  @override
  Future<void> onLoad() async {
    bool alreadyInteracted = await returnInteractedItem(interactName);
    if (alreadyInteracted) {
      alreaddyTapped = true;
    } else {
      returnHint(
        context: context,
        target: this,
        name: 'biblioteca',
        offset: const Offset(108, 86),
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
              text:
                  'Uma de suas principais formas de expressão, raramente mostrada às outras pessoas: escrita sentimental.\n',
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
                  'Geralmente frases curtas ou então textos em inglês, a escrita da artista consegue provocar os mais diversos sentimentos.\nAs frases e textos são sobre os sentimentos dela ',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            const TextSpan(
              text: '(os seus)',
            ),
            const TextSpan(
              text: ', mas é praticamente impossível não se identificar.',
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
          removeFollower('biblioteca');
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
