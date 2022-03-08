import 'package:art_gallery/characters/animals/butterfly.dart';
import 'package:art_gallery/characters/animals/frog_green.dart';
import 'package:art_gallery/characters/animals/frog_yellow.dart';
import 'package:art_gallery/interface/paused_interface.dart';
import 'package:art_gallery/interface/player_interface.dart';
import 'package:art_gallery/items/change_room/enter_museum.dart';
import 'package:art_gallery/items/null_item.dart';
import 'package:art_gallery/characters/julia.dart';
import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/characters/npc/recepcao.dart';
import 'package:art_gallery/characters/taylor.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/interact.dart';
import 'package:art_gallery/utils/sounds.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExteriorMap extends StatelessWidget {
  final bool mapPositionInInit;
  const ExteriorMap({Key? key, required this.mapPositionInInit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      map: TiledWorldMap('map/external_map.json',
          forceTileSize: Size(tileSize, tileSize),
          objectsBuilder: {
            'taylor_1': (properties) => mapPositionInInit
                ? CharacterTaylor(properties.position)
                : NullItem(properties.position),
            'taylor_2': (properties) => mapPositionInInit
                ? NullItem(properties.position)
                : CharacterTaylor(properties.position),
            'butterfly': (properties) => AnimalButterfly(properties.position),
            'enter_museum': (properties) =>
                EnterMuseum(properties.position, mapPositionInInit),
            'frog_green': (properties) => AnimalFrogGreen(properties.position),
            'frog_yellow': (properties) =>
                AnimalFrogYellow(properties.position),
            'recepcao': (properties) => mapPositionInInit
                ? CharacterRecepcionista(properties.position)
                : NullItem(properties.position),
          }),
      joystick: Joystick(
        directional: JoystickDirectional(),
        keyboardConfig: KeyboardConfig(
          enable: true,
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
      ),
      player: CharacterJulia(
        mapPositionInInit ? Vector2(1880, 2200) : Vector2(1880, 300),
      ),
      progress: Container(
        color: Colors.black,
        child: Center(
          child: SizedBox(
            child: Image.asset('assets/images/load.png'),
            width: 124,
            height: 124,
          ),
        ),
      ),
      initialActiveOverlays: const [PlayerInterface.overlayKey],
      overlayBuilderMap: {
        'playerInterface': (context, game) => PlayerInterface(game: game),
        'pausedInterface': (context, game) => PausedInterface(game: game)
      },
      onReady: (gameReady) async {
        if (canPlayMusic) {
          await Sounds.playBackgroundSound();
        }
        await Future.delayed(const Duration(seconds: 1), () {
          if (mapPositionInInit) {
            Sounds.interaction();
            if (!loadedGame) {
              TalkDialog.show(
                context,
                [
                  Say(
                    text: [
                      const TextSpan(
                        text: 'YAYYYY!!! Seu aniversário chegou, hihi.\n',
                      ),
                      const TextSpan(
                        text:
                            'Parabéns meu bem, tudo de melhor para você (inclusive eu), você merece o mundo e muito mais!!',
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
                            'Esse é um mini jogo para lembrar do quão incrível você é. Quando digo que merece o mundo, não é brincadeira <3 <3 <3\n',
                      ),
                      const TextSpan(
                        text:
                            'De todo modo, vá em frente e descubra o que isso faz, hihi',
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
                            'Ahhh... Antes que eu esqueça, você pode interagir com praticamente tudo dentro deste jogo.\n',
                      ),
                      const TextSpan(
                        text: 'Tudo o que você precisa fazer, é clicar :)\n',
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
            } else {
              TalkDialog.show(
                context,
                [
                  Say(
                    text: [
                      const TextSpan(
                        text: 'Bom te ver de volta :)\n',
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
          } else {
            adviceShowed = false;
          }
        });
      },
    );
  }
}
