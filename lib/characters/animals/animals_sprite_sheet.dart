import 'package:bonfire/bonfire.dart';

class ButterflySpriteSheet {
  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
      'sprites/butterfly.png',
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
      'sprites/butterfly.png',
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
      'sprites/butterfly.png',
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
      'sprites/butterfly.png',
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0)));
}

class FrogGreenSpriteSheet {
  static Future<SpriteAnimation> get froguinho => SpriteAnimation.load(
      'sprites/frog_1.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0)));
}

class FrogYellowSpriteSheet {
  static Future<SpriteAnimation> get froguinho => SpriteAnimation.load(
      'sprites/frog_2.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0)));
}
