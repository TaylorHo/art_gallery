import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:art_gallery/utils/interact.dart';

import 'package:art_gallery/utils/sounds.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String interactName = 'maquiagemArtistica';
bool alreaddyTapped = false;

class MaquiagemArtistica extends GameDecoration with TapGesture {
  MaquiagemArtistica(Vector2 position)
      : super(position: position, size: Vector2(48 * 6, 48));

  @override
  Future<void> onLoad() async {
    bool alreadyInteracted = await returnInteractedItem(interactName);
    if (alreadyInteracted) {
      alreaddyTapped = true;
    } else {
      returnHint(
        context: context,
        target: this,
        name: 'maquiagem_artistica',
        offset: const Offset(128, 5),
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
                  'Nesta sala são apresentadas as maquiagens artísticas realizadas pela artista.\nNenhuma deixa a desejar, contam com muitos detalhes e induzem um ótimo realismo.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
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
      onFinish: () async {
        if (!alreaddyTapped) {
          removeFollower('maquiagem_artistica');
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
