import 'package:art_gallery/utils/interact.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class Hint extends GameDecoration with TapGesture {
  String hint;

  Hint(Vector2 position, Vector2 size, {required this.hint})
      : super(position: position, size: size);

  @override
  void onTap() {
    if (totalInteract == totalInteracted) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Dica: $hint'),
          );
        },
      );
    }
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Vector2 position) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
}
