import 'package:bonfire/bonfire.dart';

class RecepcionistaSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
      'sprites/recepcionista.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(864, 96)));
}
