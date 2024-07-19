import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

abstract class CustomSprite extends SpriteAnimationComponent with HasGameRef {
  final String spritePath;
  final Vector2 spriteSize;

  // Constructor with named parameters
  CustomSprite({
    required this.spritePath,
    required this.spriteSize,
  }) : super();

  late SpriteSheet sheet;
  late SpriteAnimationComponent sprite;

  // Abstract method to be implemented by subclasses
  Future<SpriteAnimationComponent> loadSprite();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sheet = await loadSpriteSheet();
    sprite = await loadSprite();
    add(sprite);
  }

  Future<SpriteSheet> loadSpriteSheet() async {
    return SpriteSheet(
      image: await game.images.load(spritePath),
      srcSize: spriteSize,
    );
  }
}
