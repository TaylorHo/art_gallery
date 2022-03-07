import 'package:art_gallery/interface/paused_interface.dart';
import 'package:art_gallery/utils/interact.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class PlayerInterface extends StatefulWidget {
  static const overlayKey = 'playerInterface';
  final BonfireGame game;
  const PlayerInterface({Key? key, required this.game}) : super(key: key);

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '$totalInteracted/$totalInteract',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                      decoration: TextDecoration.none,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
              onTap: () {
                widget.game.player?.stopMoveAlongThePath();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                        '$totalInteracted itens interagidos\n$totalInteract itens para interagir',
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '||',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                      decoration: TextDecoration.none,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              onTap: () {
                widget.game.player?.stopMoveAlongThePath();
                widget.game.overlays.remove(PlayerInterface.overlayKey);
                widget.game.overlays.add(PausedInterface.overlayKey);
              },
            ),
          )
        ],
      ),
    );
  }
}
