import 'package:bonfire/bonfire.dart';

class ReactionsSpriteSheet {
  static Future<SpriteAnimation> get heartEmoji => SpriteAnimation.load(
      'sprites/emojis.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.12,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(0, 96)));
}
