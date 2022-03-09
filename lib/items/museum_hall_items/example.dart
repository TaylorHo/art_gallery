import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/hint.dart';
import 'package:art_gallery/utils/interact.dart';
import 'package:art_gallery/utils/last_item.dart';
import 'package:art_gallery/utils/sounds.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String interactName = 'interactExample';
bool alreaddyTapped = false;

class ExampleComponent extends GameDecoration with TapGesture, Sensor {
  ExampleComponent(Vector2 position)
      : super(position: position, size: Vector2(32, 32)) {
    setupSensorArea(
        areaSensor: [CollisionArea.rectangle(size: Vector2(32, 32))]);
  }

  @override
  Future<void> onLoad() async {
    bool alreadyInteracted = await returnInteractedItem(interactName);
    if (alreadyInteracted) {
      alreaddyTapped = true;
    } else {
      returnHint(
        context: context,
        target: this,
        name: 'example',
        offset: const Offset(12, 5),
      );
    }
    return super.onLoad();
  }

  @override
  void onTap() {
    gameRef.player?.stopMoveAlongThePath();
    if (!alreaddyTapped) {
      removeFollower('example');
      saveInteractedItem(interactName);
    }
    Sounds.interaction();
    TalkDialog.show(
      context,
      [
        Say(
          text: [
            const TextSpan(
              text: 'Texto',
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
        alreaddyTapped = true;
        isLastItem(context);
      },
    );
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Vector2 position) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}

  @override
  void onContact(GameComponent component) {}
}
