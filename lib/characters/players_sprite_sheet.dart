import 'package:bonfire/bonfire.dart';

class JuliaSpriteSheet {
  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
      'sprites/julia.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(576, 96)));

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
      'sprites/julia.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(0, 96)));

  static Future<SpriteAnimation> get idleUp => SpriteAnimation.load(
      'sprites/julia.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(288, 96)));

  static Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
      'sprites/julia.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(864, 96)));

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
      'sprites/julia.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(576, 192)));

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
      'sprites/julia.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(0, 192)));

  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
      'sprites/julia.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(288, 192)));

  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
      'sprites/julia.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(864, 192)));
}

class TaylorSpriteSheet {
  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
      'sprites/taylor.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(576, 96)));

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
      'sprites/taylor.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(0, 96)));

  static Future<SpriteAnimation> get idleUp => SpriteAnimation.load(
      'sprites/taylor.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(288, 96)));

  static Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
      'sprites/taylor.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(864, 96)));

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
      'sprites/taylor.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(576, 192)));

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
      'sprites/taylor.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(0, 192)));

  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
      'sprites/taylor.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(288, 192)));

  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
      'sprites/taylor.png',
      SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.15,
          textureSize: Vector2(48, 96),
          texturePosition: Vector2(864, 192)));
}
