import 'package:art_gallery/characters/animals/frog_green.dart';
import 'package:art_gallery/characters/animals/frog_yellow.dart';
import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/characters/reactions_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/player_name.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class CharacterJulia extends SimplePlayer with ObjectCollision {
  int timesHeartShowed = 0;

  CharacterJulia(Vector2 position)
      : super(
          position: position,
          size: Vector2(tileSize, tileSize * 2),
          animation: SimpleDirectionAnimation(
              idleUp: JuliaSpriteSheet.idleUp,
              idleRight: JuliaSpriteSheet.idleRight,
              idleDown: JuliaSpriteSheet.idleDown,
              idleLeft: JuliaSpriteSheet.idleLeft,
              runRight: JuliaSpriteSheet.runRight,
              runUp: JuliaSpriteSheet.runUp,
              runDown: JuliaSpriteSheet.runDown,
              runLeft: JuliaSpriteSheet.runLeft),
          speed: 130,
          initDirection: Direction.up,
        ) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: Vector2(34, 34), align: Vector2(8, 62))
    ]));
  }

  @override
  Future<void> onLoad() {
    returnName(
      context: context,
      target: this,
      name: 'Júlia',
    );

    return super.onLoad();
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is AnimalFrogGreen || component is AnimalFrogYellow) {
      if (!FollowerWidget.isVisible('viu_sapinho')) {
        FollowerWidget.remove('júlia');
        FollowerWidget.show(
          identify: 'viu_sapinho',
          context: context,
          target: this,
          child: ReactionsSpriteSheet.heartEmoji.asWidget(),
          align: const Offset(0, -32),
        );
      }
    }
    return super.onCollision(component, active);
  }

  @override
  void update(double dt) {
    if (FollowerWidget.isVisible('viu_sapinho')) {
      if (timesHeartShowed > 100) {
        timesHeartShowed = 0;
        FollowerWidget.remove('viu_sapinho');
        returnName(
          context: context,
          target: this,
          name: 'Júlia',
        );
      } else {
        timesHeartShowed++;
      }
    }
    super.update(dt);
  }
}
