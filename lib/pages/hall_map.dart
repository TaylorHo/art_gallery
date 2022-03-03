import 'package:art_gallery/characters/players_sprite_sheet.dart';
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
import 'package:flutter/services.dart';

class MuseumHallMap extends StatelessWidget {
  final bool mapPositionInInit;
  final bool positionInEntrance;

  const MuseumHallMap({
    Key? key,
    required this.mapPositionInInit,
    required this.positionInEntrance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      map: TiledWorldMap(
        'map/hall_map.json',
        forceTileSize: Size(tileSize, tileSize),
        objectsBuilder: {
          'taylor_1': (properties) => positionInEntrance
              ? CharacterTaylor(properties.position)
              : NullItem(properties.position),
          'taylor_2': (properties) => positionInEntrance
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
            keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
          )),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
      ),
      player: CharacterJulia(Vector2(900, 2000)),
      onReady: (gameReady) async {
        await Future.delayed(const Duration(milliseconds: 600), () {
          adviceShowed = false;
          if (mapPositionInInit) {
            TalkDialog.show(
              context,
              [
                Say(
                    text: [
                      const TextSpan(
                        text: 'Ok, vamos lá...\n',
                      ),
                      const TextSpan(
                        text:
                            'Aqui dentro do museu você pode interagir com as coisas de duas formas: clicando ou encostando com seu player.',
                      ),
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
                            'Os itens que tiverem (?) são de clicar.\nAgora os de encostar com o personagem, não tem nenhuma dica, você vai ter que descobrir...',
                      ),
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
                            'Lembra do sapinho? O contexto é o mesmo, só precisa encostar com o player.\n',
                      ),
                      const TextSpan(
                        text:
                            'Antes de entrar no hall principal (seguindo reto para a frente), sugiro explorar essa área inicial, hihi :)\n',
                      ),
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
        });
      },
    );
  }
}
