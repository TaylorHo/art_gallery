import 'package:art_gallery/characters/animals/frog_green.dart';
import 'package:art_gallery/characters/animals/frog_yellow.dart';
import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/interface/paused_interface.dart';
import 'package:art_gallery/interface/player_interface.dart';
import 'package:art_gallery/items/change_room/enter_room_1.dart';
import 'package:art_gallery/items/change_room/enter_room_2.dart';
import 'package:art_gallery/items/change_room/leave_museum.dart';
import 'package:art_gallery/items/final_secret/hint.dart';
import 'package:art_gallery/items/museum_hall_items/biblioteca.dart';
import 'package:art_gallery/items/museum_hall_items/brinquedos.dart';
import 'package:art_gallery/items/museum_hall_items/child_room.dart';
import 'package:art_gallery/items/museum_hall_items/dobraduras.dart';
import 'package:art_gallery/items/museum_hall_items/explicacao_plantinhas.dart';
import 'package:art_gallery/items/museum_hall_items/florzinhas.dart';
import 'package:art_gallery/items/museum_hall_items/intro_museu.dart';
import 'package:art_gallery/items/final_secret/letter_1.dart';
import 'package:art_gallery/items/museum_hall_items/material_pintura.dart';
import 'package:art_gallery/items/museum_hall_items/mesinha_de_pintura.dart';
import 'package:art_gallery/items/museum_hall_items/motivo_especial.dart';
import 'package:art_gallery/items/museum_hall_items/pegar_suquinho.dart';
import 'package:art_gallery/items/museum_hall_items/pequenos_desenhos.dart';
import 'package:art_gallery/items/museum_hall_items/pinturas_1.dart';
import 'package:art_gallery/items/museum_hall_items/pinturas_2.dart';
import 'package:art_gallery/items/museum_hall_items/plantinhas.dart';
import 'package:art_gallery/items/museum_hall_items/precisa_mostrar_intro.dart';
import 'package:art_gallery/items/museum_hall_items/principal_obra.dart';
import 'package:art_gallery/items/museum_hall_items/sapinhos.dart';
import 'package:art_gallery/items/null_item.dart';
import 'package:art_gallery/characters/julia.dart';
import 'package:art_gallery/characters/taylor.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/interact.dart';
import 'package:art_gallery/utils/sounds.dart';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';

class MuseumHallMap extends StatelessWidget {
  final bool mapPositionInInit;
  final bool positionInEntrance;

  const MuseumHallMap({
    Key? key,
    required this.mapPositionInInit,
    this.positionInEntrance = false,
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
          'intro_museu': (properties) => IntroMuseu(properties.position),
          'sapinhos': (properties) => SapinhosNoLaguinho(properties.position),
          'precisa_mostrar_intro': (properties) =>
              PrecisaMostrarIntro(properties.position),
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
          'frog_green': (properties) => AnimalFrogGreen(properties.position),
          'frog_yellow': (properties) => AnimalFrogYellow(properties.position),
          'pegar_suquinho': (properties) => PegarSuquinho(properties.position),
          'principal_obra': (properties) => PrincipalObra(properties.position),
          'pinturas_1': (properties) => Pinturas1(properties.position),
          'pinturas_2': (properties) => Pinturas2(properties.position),
          'dobraduras': (properties) => Dobraduras(properties.position),
          'premio_especial': (properties) => totalInteract == totalInteracted
              ? Letter1(properties.position)
              : NullItem(properties.position),
          'pequenos_desenhos': (properties) =>
              PequenosDesenhos(properties.position),
          'motivo_especial': (properties) =>
              MotivoEspecial(properties.position),
          'florzinhas_1': (properties) =>
              FlorzinhasNoMuseu(properties.position, '1'),
          'florzinhas_2': (properties) =>
              FlorzinhasNoMuseu(properties.position, '2'),
          'biblioteca': (properties) =>
              BibliotecaComLivros(properties.position),
          'hint_1': (properties) =>
              Hint(properties.position, Vector2(72, 86), hint: 'M'),
          'hint_2': (properties) =>
              Hint(properties.position, Vector2(56, 86), hint: 'E'),
          'hint_3': (properties) =>
              Hint(properties.position, Vector2(56, 86), hint: 'U'),
          'hint_4': (properties) =>
              Hint(properties.position, Vector2(72, 86), hint: 'E'),
          'hint_5': (properties) =>
              Hint(properties.position, Vector2(138, 92), hint: 'T'),
          'hint_6': (properties) =>
              Hint(properties.position, Vector2(138, 92), hint: 'E'),
          'hint_7': (properties) =>
              Hint(properties.position, Vector2(56, 56), hint: 'R'),
          'hint_8': (properties) =>
              Hint(properties.position, Vector2(56, 56), hint: 'N'),
          'hint_9': (properties) =>
              Hint(properties.position, Vector2(72, 96), hint: 'O'),
          'hint_10': (properties) =>
              Hint(properties.position, Vector2(56, 86), hint: 'A'),
          'hint_11': (properties) =>
              Hint(properties.position, Vector2(56, 86), hint: 'M'),
          'hint_12': (properties) =>
              Hint(properties.position, Vector2(72, 96), hint: 'O'),
          'hint_13': (properties) =>
              Hint(properties.position, Vector2(56, 56), hint: 'R'),
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
      player: CharacterJulia(Vector2(900, 2000)),
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
        await Future.delayed(const Duration(milliseconds: 600), () {
          adviceShowed = false;
          if (mapPositionInInit) {
            Sounds.interaction();
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
                          'Os itens que tiverem (?) são de clicar.\nAgora os de encostar com o personagem, não tem nenhuma dica, você vai ter que descobrir...',
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
                          'Ahhh, só mais uma coisa, quando o texto aparece em ',
                    ),
                    const TextSpan(
                      text: 'itálico',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    const TextSpan(
                      text: ', é pq estou lendo a descrição da obra.',
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
        });
      },
    );
  }
}
