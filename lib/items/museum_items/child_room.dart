import 'package:art_gallery/characters/julia.dart';
import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool dialogShowed = false;

class ChildRoom extends GameDecoration with Sensor {
  ChildRoom(Vector2 position)
      : super(position: position, size: Vector2(12, 6.75 * tileSize)) {
    setupSensorArea(areaSensor: [
      CollisionArea.rectangle(size: Vector2(12, 6.75 * tileSize))
    ]);
  }

  @override
  void onContact(GameComponent component) {
    if (!dialogShowed) {
      if (component is CharacterJulia) {
        gameRef.player?.stopMoveAlongThePath();

        dialogShowed = true;
        TalkDialog.show(
          context,
          [
            Say(
                text: [const TextSpan(text: 'Espera... o que é isso?')],
                person: SizedBox(
                  child: JuliaSpriteSheet.idleRight.asWidget(),
                  height: 150,
                  width: 100,
                ),
                speed: saySpeed),
            Say(
                text: [
                  const TextSpan(
                      text:
                          'Essa é uma área para as crianças. Elas podem ficar aqui brincando, desenhando ou pintando.\n'),
                  const TextSpan(
                      text:
                          'O objetivo é que elas desenvolvam sua criatividade, e ainda podem visitar o museu, sempre que quiserem :)'),
                ],
                person: SizedBox(
                  child: TaylorSpriteSheet.idleRight.asWidget(),
                  height: 150,
                  width: 100,
                ),
                speed: saySpeed),
            Say(
                text: [
                  const TextSpan(
                      text:
                          'Isso não podia faltar, porque sei que você ama ensinar crianças a pintar ou desenhar.\nAdmiro muito isso em você <3')
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
    }
  }
}
