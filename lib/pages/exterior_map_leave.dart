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

class ExteriorMapLeave extends StatelessWidget {
  const ExteriorMapLeave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      map: TiledWorldMap('map/external_map_leave.json',
          forceTileSize: Size(tileSize, tileSize),
          objectsBuilder: {
            'taylor': (properties) => CharacterTaylor(properties.position),
            'butterfly': (properties) => AnimalButterfly(properties.position),
            'enter_museum': (properties) => EnterMuseum(properties.position),
            'frog_green': (properties) => AnimalFrogGreen(properties.position),
            'frog_yellow': (properties) =>
                AnimalFrogYellow(properties.position),
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
      player: CharacterJulia(Vector2(1880, 300)),
      onReady: (gameReady) async {
        await Future.delayed(const Duration(seconds: 2), () {
          adviceShowed = false;
        });
      },
    );
  }
}
