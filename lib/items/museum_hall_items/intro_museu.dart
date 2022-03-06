import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntroMuseu extends GameDecoration with TapGesture {
  IntroMuseu(Vector2 position)
      : super(position: position, size: Vector2(92, 42));

  @override
  Future<void> onLoad() {
    returnHint(
      context: context,
      target: this,
      name: 'intro_museu',
      offset: const Offset(38, -12),
    );
    return super.onLoad();
  }

  @override
  void onTap() {
    gameRef.player?.stopMoveAlongThePath();
    removeFollower('intro_museu');
    showMuseumIntroDialog(context);
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Vector2 position) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
}

void showMuseumIntroDialog(context) {
  museumIntroShowed = true;
  TalkDialog.show(context, [
    Say(
      text: [
        const TextSpan(
          text:
              'Julia\'s Art Gallery.\nExposição de arte no formato de um jogo digital das obras e diferentes formas de expressão de Júlia de Souza, uma artista versada nos mais diversos tipos de arte. Fascinante, lhe garanto.',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
      speed: saySpeed,
      boxDecoration: BoxDecoration(
        color: Colors.black.withOpacity(0.75),
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
              'Na sincera opinião do idealizador da exposição, a artista é inegavelmente fascinante, além de extremamente habilidosa em todas as formas de expressão utilizadas.',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
      speed: saySpeed,
      boxDecoration: BoxDecoration(
        color: Colors.black.withOpacity(0.75),
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
              'Vá em frente e vislumbre uma fração do imenso potencial da artista.\nBoa visita ao museu :)',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
      speed: saySpeed,
      boxDecoration: BoxDecoration(
        color: Colors.black.withOpacity(0.75),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    ),
  ], logicalKeyboardKeysToNext: [
    LogicalKeyboardKey.space,
    LogicalKeyboardKey.enter
  ]);
}
