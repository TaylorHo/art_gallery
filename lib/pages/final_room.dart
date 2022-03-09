import 'package:art_gallery/interface/paused_interface.dart';
import 'package:art_gallery/interface/player_interface.dart';
import 'package:art_gallery/characters/julia.dart';
import 'package:art_gallery/characters/taylor.dart';
import 'package:art_gallery/items/change_room/leave_room.dart';
import 'package:art_gallery/items/final_secret/final.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/sounds.dart';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';

class FinalRoom extends StatelessWidget {
  const FinalRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      map: TiledWorldMap(
        'map/final_room.json',
        forceTileSize: Size(tileSize, tileSize),
        objectsBuilder: {
          'taylor': (properties) => CharacterTaylor(properties.position),
          'leave_room': (properties) => LeaveRoom(properties.position),
          'final': (properties) => FinalGift(properties.position),
        },
      ),
      showCollisionArea: true,
      joystick: Joystick(
          directional: JoystickDirectional(),
          keyboardConfig: KeyboardConfig(
            enable: true,
            keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
          )),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
      ),
      player: CharacterJulia(Vector2(660, 830)),
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
        adviceShowed = false;
        if (canPlayMusic) {
          await Sounds.playBackgroundSound();
        }
      },
    );
  }
}
