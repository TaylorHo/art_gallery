import 'package:art_gallery/characters/animals/butterfly.dart';
import 'package:art_gallery/characters/animals/frog_green.dart';
import 'package:art_gallery/characters/animals/frog_yellow.dart';
import 'package:art_gallery/characters/items/enter_museum.dart';
import 'package:art_gallery/characters/julia.dart';
import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/characters/npc/recepcao.dart';
import 'package:art_gallery/characters/taylor.dart';
import 'package:art_gallery/main.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExteriorMap extends StatelessWidget {
  const ExteriorMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      map: TiledWorldMap('map/external_map.json',
          forceTileSize: Size(tileSize, tileSize),
          objectsBuilder: {
            'taylor': (properties) => CharacterTaylor(properties.position),
            'butterfly': (properties) => AnimalButterfly(properties.position),
            'enter_museum': (properties) => EnterMuseum(properties.position),
            'frog_green': (properties) => AnimalFrogGreen(properties.position),
            'frog_yellow': (properties) =>
                AnimalFrogYellow(properties.position),
            'recepcao': (properties) =>
                CharacterRecepcionista(properties.position)
          }),
      joystick: Joystick(
        directional: JoystickDirectional(),
        keyboardConfig: KeyboardConfig(
          enable: true,
          keyboardDirectionalType: KeyboardDirectionalType.arrows,
        ),
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        smoothCameraEnabled: true,
      ),
      player: CharacterJulia(Vector2(1880, 2200)),
      onReady: (gameReady) async {
        await Future.delayed(const Duration(seconds: 2), () {
          TalkDialog.show(
            context,
            [
              Say(
                  text: [
                    const TextSpan(
                        text: 'YAYYYY!!! Seu aniversário chegou, hihi.\n'),
                    const TextSpan(
                        text:
                            'Parabéns meu bem, tudo de melhor para você (inclusive eu), você merece o mundo e muito mais!!'),
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
                            'Esse é um mini jogo para lembrar do quão incrível você é. Quando digo que merece o mundo, não é brincadeira <3 <3 <3\n'),
                    const TextSpan(
                        text:
                            'De todo modo, vá em frente e descubra o que isso faz, hihi'),
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
                            'Ahhh... Antes que eu esqueça, você pode interagir com praticamente tudo dentro deste jogo.\n'),
                    const TextSpan(
                        text: 'Tudo o que você precisa fazer, é clicar :)\n'),
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
        });
      },
    );
  }
}
