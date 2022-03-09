import 'package:art_gallery/characters/julia.dart';
import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/interact.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterRoom2 extends GameDecoration with Sensor {
  EnterRoom2(Vector2 position)
      : super(position: position, size: Vector2(tileSize * 4, 10)) {
    setupSensorArea(
        areaSensor: [CollisionArea.rectangle(size: Vector2(tileSize * 4, 10))]);
  }

  @override
  void onContact(GameComponent component) {
    if (!adviceShowed) {
      if (component is CharacterJulia) {
        FollowerWidget.removeAll();
        adviceShowed = true;

        gameRef.player?.stopMoveAlongThePath();

        if (totalInteract == totalInteracted) {
          gameRef.player?.stopMoveAlongThePath();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Senha:'),
                content: TextField(
                  onChanged: (value) {
                    if (value.toLowerCase() == 'meu eterno amor') {
                      Navigator.pop(context, 'OK');
                      // puxa pra próxima fase
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Parabéns!! Você Conseguiu :)'),
                            actions: [
                              TextButton(
                                child: const Text('Ver a sala final'),
                                onPressed: () => {
                                  // puxa a proxima sala
                                },
                              ),
                            ],
                            actionsAlignment: MainAxisAlignment.center,
                          );
                        },
                      );
                    }
                  },
                  controller: TextEditingController(),
                  decoration:
                      const InputDecoration(hintText: "Insira a senha aqui"),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancelar'),
                    onPressed: () => {
                      Navigator.pop(context, 'Cancel'),
                      Future.delayed(const Duration(seconds: 6), () {
                        adviceShowed = false;
                      }),
                    },
                  ),
                ],
                actionsAlignment: MainAxisAlignment.center,
              );
            },
          );
        } else {
          gameRef.player?.stopMoveAlongThePath();
          TalkDialog.show(context, [
            Say(
              text: [
                const TextSpan(
                  text:
                      'Esse caminho está trancado\nInteraja com o resto do jogo para descobrir como abrir :)',
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
          ], logicalKeyboardKeysToNext: [
            LogicalKeyboardKey.space,
            LogicalKeyboardKey.enter
          ], onFinish: () {
            Future.delayed(const Duration(seconds: 6), () {
              adviceShowed = false;
            });
          });
        }
      }
    }
  }
}
