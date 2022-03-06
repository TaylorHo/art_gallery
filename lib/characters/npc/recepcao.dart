import 'package:art_gallery/characters/npc_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/player_name.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CharacterRecepcionista extends GameDecoration with ObjectCollision {
  bool dialogShowed = false;
  CharacterRecepcionista(Vector2 position)
      : super.withAnimation(
          position: position,
          size: Vector2(tileSize, tileSize * 2),
          animation: RecepcionistaSpriteSheet.idleRight,
        ) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: Vector2(34, 34), align: Vector2(8, 62))
    ]));
  }

  @override
  void update(double dt) {
    if (!dialogShowed) {
      seeComponent(
        gameRef.player!,
        observed: (player) {
          gameRef.player?.stopMoveAlongThePath();
          dialogShowed = true;
          TalkDialog.show(
            context,
            [
              Say(
                text: [
                  const TextSpan(
                    text: 'Ahhh, vocês chegaram!\n',
                  ),
                  const TextSpan(
                    text: 'Estava esperando por vocês!\n',
                  ),
                ],
                person: SizedBox(
                  child: RecepcionistaSpriteSheet.idleRight.asWidget(),
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
                          'A pedido do Sr. Taylor, preparamos uma exposição de arte dentro deste museu, exclusivamente para a Srta. Júlia.\n',
                    ),
                    const TextSpan(
                      text:
                          'As obras que estão expostas são surpresa, mas você está livre para entrar e ver por si mesma :)\n',
                    ),
                  ],
                  person: SizedBox(
                    child: RecepcionistaSpriteSheet.idleRight.asWidget(),
                    height: 150,
                    width: 100,
                  ),
                  speed: 1),
            ],
            logicalKeyboardKeysToNext: [
              LogicalKeyboardKey.space,
              LogicalKeyboardKey.enter
            ],
          );
        },
        radiusVision: tileSize * 3,
      );
    }

    super.update(dt);
  }

  @override
  Future<void> onLoad() {
    returnName(
      context: context,
      target: this,
      name: 'Recepcionista',
      offset: const Offset(-13, 4),
    );

    return super.onLoad();
  }
}
