import 'package:art_gallery/interface/player_interface.dart';
import 'package:art_gallery/menu.dart';
import 'package:art_gallery/utils/interact.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class PausedInterface extends StatefulWidget {
  static const overlayKey = 'pausedInterface';
  final BonfireGame game;
  const PausedInterface({Key? key, required this.game}) : super(key: key);

  @override
  State<PausedInterface> createState() => _PausedInterfaceState();
}

class _PausedInterfaceState extends State<PausedInterface> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      color: Colors.black.withOpacity(0.80),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Jogo Pausado',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 34),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  minimumSize: const Size(100, 40),
                ),
                child: const Text(
                  'Reiniciar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
                onPressed: () {
                  // reinicia
                  resetInteractedItems();
                  widget.game.overlays.remove(PausedInterface.overlayKey);
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const Menu(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  minimumSize: const Size(100, 40),
                ),
                child: const Text(
                  'Voltar ao Jogo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                onPressed: () {
                  widget.game.overlays.remove(PausedInterface.overlayKey);
                  widget.game.overlays.add(PlayerInterface.overlayKey);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
