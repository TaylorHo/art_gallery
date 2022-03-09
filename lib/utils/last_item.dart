import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/interact.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void isLastItem(BuildContext context) {
  if (totalInteract == totalInteracted && !lastItemShowed) {
    lastItemShowed = true;

    TalkDialog.show(
      context,
      [
        Say(
          text: [
            const TextSpan(
              text: 'Você interagiu com todas as obras!!',
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
                  'Eu diria que você terminou o jogo, mas acho que você ainda precisa abrir uma porta, não?',
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
    );
  }
}
