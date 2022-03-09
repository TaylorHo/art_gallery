import 'package:art_gallery/interface/paused_interface.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/final_dialog.dart';
import 'package:art_gallery/utils/interact.dart';
import 'package:art_gallery/utils/last_item.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'dart:async' as async;

class PlayerInterface extends StatefulWidget {
  static const overlayKey = 'playerInterface';
  final BonfireGame game;
  const PlayerInterface({Key? key, required this.game}) : super(key: key);

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  late async.Timer totalInteractedItems;
  int interactedItems = 0;

  @override
  void initState() {
    totalInteractedItems = async.Timer.periodic(
        const Duration(milliseconds: 200), _verifyInteractions);
    super.initState();
  }

  @override
  void dispose() {
    totalInteractedItems.cancel();
    super.dispose();
  }

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
                  SizedBox(
                    width: 100,
                    height: 45,
                    child: Container(
                      color: Colors.transparent,
                      child: Text(
                        '$interactedItems/$totalInteract',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.75),
                          decoration: TextDecoration.none,
                          fontSize: 32,
                        ),
                      ),
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
                        '$interactedItems itens interagidos\n$totalInteract itens para interagir',
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
                  SizedBox(
                    width: 100,
                    height: 45,
                    child: Container(
                      color: Colors.transparent,
                      child: Icon(
                        Icons.pause,
                        color: Colors.white.withOpacity(0.75),
                        size: 40,
                      ),
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

  void _verifyInteractions(async.Timer timer) {
    if (interactedItems != totalInteracted) {
      setState(() {
        interactedItems = totalInteracted;
      });
    }
    isLastItem(context);
    if (giftInteracted && !finalDialogShowed) {
      finalDialogShowed = true;
      showFinalDialog(context);
    }
  }
}
