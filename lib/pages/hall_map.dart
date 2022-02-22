import 'package:art_gallery/characters/julia.dart';
import 'package:art_gallery/characters/taylor.dart';
import 'package:art_gallery/main.dart';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';

class MuseumHallMap extends StatelessWidget {
  const MuseumHallMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      map: TiledWorldMap(
        'map/hall_map.json',
        forceTileSize: Size(tileSize, tileSize),
        objectsBuilder: {
          'taylor': (properties) => CharacterTaylor(properties.position),
        },
      ),
      joystick: Joystick(
          directional: JoystickDirectional(),
          keyboardConfig: KeyboardConfig(
            enable: true,
            keyboardDirectionalType: KeyboardDirectionalType.arrows,
          )),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        smoothCameraEnabled: true,
      ),
      player: CharacterJulia(Vector2(920, 2700)),
    );
  }
}
