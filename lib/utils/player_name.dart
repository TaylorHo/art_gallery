import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

// pode usar o "name" para esconder a hint depois de visualizada a obra

void returnName(
    {required BuildContext context,
    required GameComponent target,
    required String name,
    Offset offset = const Offset(9, 4)}) {
  return FollowerWidget.show(
    identify: name.toLowerCase().replaceAll(' ', '_'),
    context: context,
    target: target,
    child: Text(
      name,
      style: const TextStyle(
        fontSize: 12,
        decoration: TextDecoration.none,
        color: Colors.white,
      ),
    ),
    align: offset,
  );
}
