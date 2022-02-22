import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

// pode usar o "name" para esconder a hint depois de visualizada a obra

void returnHint(
    {required BuildContext context,
    required GameComponent target,
    String name = 'badge',
    Offset offset = const Offset(12, 5)}) {
  return FollowerWidget.show(
    identify: name,
    context: context,
    target: target,
    child: Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: const BoxConstraints(
        minWidth: 16,
        minHeight: 12,
      ),
      child: const Text(
        '?',
        style: TextStyle(
          height: 1.2,
          color: Colors.white,
          fontSize: 10,
          decoration: TextDecoration.none,
        ),
        textAlign: TextAlign.center,
      ),
    ),
    align: offset,
  );
}
