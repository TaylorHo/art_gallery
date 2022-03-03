import 'package:art_gallery/items/change_room/enter_room_1.dart';
import 'package:art_gallery/items/change_room/enter_room_2.dart';
import 'package:art_gallery/items/change_room/leave_museum.dart';
import 'package:art_gallery/items/museum_hall_items/brinquedos.dart';
import 'package:art_gallery/items/museum_hall_items/child_room.dart';
import 'package:art_gallery/items/museum_hall_items/explicacao_plantinhas.dart';
import 'package:art_gallery/items/museum_hall_items/material_pintura.dart';
import 'package:art_gallery/items/museum_hall_items/mesinha_de_pintura.dart';
import 'package:art_gallery/items/museum_hall_items/plantinhas.dart';
import 'package:art_gallery/items/null_item.dart';
import 'package:art_gallery/characters/julia.dart';
import 'package:art_gallery/characters/taylor.dart';
import 'package:art_gallery/main.dart';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';

class MuseumHallMap extends StatelessWidget {
  final bool mapPositionInInit;

  const MuseumHallMap({Key? key, required this.mapPositionInInit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      map: TiledWorldMap(
        'map/hall_map.json',
        forceTileSize: Size(tileSize, tileSize),
        objectsBuilder: {
          'taylor_1': (properties) => mapPositionInInit
              ? CharacterTaylor(properties.position)
              : NullItem(properties.position),
          'taylor_2': (properties) => mapPositionInInit
              ? NullItem(properties.position)
              : CharacterTaylor(properties.position),
          'leave_museum': (properties) => LeaveMuseum(properties.position),
          'enter_room_1': (properties) => EnterRoom1(properties.position),
          'enter_room_2': (properties) => EnterRoom2(properties.position),
          'area_de_criancas': (properties) => ChildRoom(properties.position),
          'plantinhas': (properties) =>
              CanteirosDePlantinhas(properties.position),
          'explicacao_plantinhas': (properties) =>
              ExplicacaoPlantinhas(properties.position),
          'mais_material_de_pintura': (properties) =>
              MaterialDePintura(properties.position),
          'brinquedos': (properties) =>
              BrinquedosSeparados(properties.position),
          'mesinha_de_pintura': (properties) =>
              MesinhaDePintura(properties.position),
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
      player: CharacterJulia(Vector2(900, 2000)),
      onReady: (gameReady) async {
        await Future.delayed(const Duration(seconds: 2), () {
          adviceShowed = false;
        });
      },
    );
  }
}
