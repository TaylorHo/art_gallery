import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:art_gallery/utils/interact.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String interactName = 'interactPequenosDesenhos';
bool alreaddyTapped = false;

class PequenosDesenhos extends GameDecoration with TapGesture {
  PequenosDesenhos(Vector2 position)
      : super(position: position, size: Vector2(278, 178));

  @override
  Future<void> onLoad() async {
    bool alreadyInteracted = await returnInteractedItem(interactName);
    if (alreadyInteracted) {
      alreaddyTapped = true;
    } else {
      returnHint(
        context: context,
        target: this,
        name: 'pequenos_desenhos',
        offset: const Offset(128, 76),
      );
    }
    return super.onLoad();
  }

  @override
  void onTap() {
    gameRef.player?.stopMoveAlongThePath();
    if (!alreaddyTapped) {
      removeFollower('pequenos_desenhos');
      saveInteractedItem(interactName);
    }
    TalkDialog.show(
      context,
      [
        Say(
          text: [
            const TextSpan(
              text:
                  'A grande maioria das obras são desenhos ou esboços feitos à mão, geralmente em um pequeno pedaço de papel, ápesar de às vezes serem desenhos digitais.\n',
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
                  'Estas são as obras mais numerosas, e mesmo muitas vezes sendo realmente um esboço feito durante uma aula entediante, os traços são firmes, bem definidos e refletem a incrível habilidade da artista.\n',
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
                  'Sinceramente eu preferiria falar muito mais deles, porque são os desenhos que mais me fascinam. Você é incrível, meu amor <3\n',
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
