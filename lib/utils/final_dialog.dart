import 'package:flutter/material.dart';

void showFinalDialog(context) {
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
    barrierDismissible: false,
  );
}
