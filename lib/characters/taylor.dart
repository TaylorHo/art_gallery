import 'package:art_gallery/characters/players_sprite_sheet.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/player_name.dart';
import 'package:bonfire/bonfire.dart';

class CharacterTaylor extends SimpleEnemy with ObjectCollision {
  CharacterTaylor(Vector2 position)
      : super(
          position: position,
          size: Vector2(tileSize, tileSize * 2),
          life: 1000,
          animation: SimpleDirectionAnimation(
              idleUp: TaylorSpriteSheet.idleUp,
              idleRight: TaylorSpriteSheet.idleRight,
              idleDown: TaylorSpriteSheet.idleDown,
              idleLeft: TaylorSpriteSheet.idleLeft,
              runRight: TaylorSpriteSheet.runRight,
              runUp: TaylorSpriteSheet.runUp,
              runDown: TaylorSpriteSheet.runDown,
              runLeft: TaylorSpriteSheet.runLeft),
          speed: 130,
          initDirection: Direction.up,
        ) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: Vector2(34, 34), align: Vector2(8, 62))
    ]));
  }

  @override
  void update(double dt) {
    seePlayer(
        observed: (player) {
          seeAndMoveToPlayer(
              closePlayer: (player) {},
              radiusVision: tileSize * 10,
              margin: 28);
        },
        radiusVision: tileSize * 10);

    super.update(dt);
  }

  @override
  Future<void> onLoad() {
    returnName(
      context: context,
      target: this,
      name: 'Taylor',
    );

    return super.onLoad();
  }
}
