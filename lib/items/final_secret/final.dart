import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/sounds.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FinalGift extends GameDecoration with TapGesture {
  FinalGift(Vector2 position)
      : super(position: position, size: Vector2(160, 120));

  @override
  void onTap() {
    gameRef.player?.stopMoveAlongThePath();
    Sounds.interaction();
    TalkDialog.show(
      context,
      [
        Say(
          text: [
            const TextSpan(
              text: 'Ok, agora você terminou o jogo, hihi\n',
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
                  'Parabéns meu amor!!! Agora, quero falar um pouco sobre o porquê de ter feito ele, espero que leia até o final <3\n',
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
      onFinish: () {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('Obrigado por jogar <3'),
              content: Text(
                'Esse foi um jogo simples, com apenas um enigma para ser resolvidos, mas não era esse o objetivo dele...\nO que eu queria mesmo ao criar esse mini jogo para você, é te incentivar a continuar fazendo sua arte. Você é incrível de mais em tudo relacionado à isso, tudo mesmo, e dá para ver o brilho em seus olhos quando está desenhando, pintando ou fazendo qualquer outra coisa que considero imensamente incrível.\nIsso é algo que faz parte de você, e algo que admiro muito. Claro, é você que decide se quer ou não fazer isso, mas adoraria ver essa galeria de arte em formato digital se tornar física, algum dia, e sei que você tem potencial para isso. Vou sempre te apoiar, não só nisso (até pq você pode não querer despender seu tempo nisso), mas em tudo o que você faz.\nVou sempre te apoiar.\nVou sempre estar com você.\nVou sempre ajudar no que puder.\nAssim como quero você para sempre <3\n\n\nEu te amo mais que tudo, e apesar de eu saber que minha opinião ainda é pouco, quero que saiba que acho você incrível de mais, assim como todas as suas formas de expressão.\nVocê é minha artista favorita, sem igual <3',
                textAlign: TextAlign.center,
              ),
            );
          },
        );
      },
    );
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Vector2 position) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
}
