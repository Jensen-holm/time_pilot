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
  SpriteAnimationComponent sprite = SpriteAnimationComponent();
  Map<int, SpriteAnimation> animations = {};

  // Abstract method to be implemented by subclasses
  // this will set attributes to the sprite attribute
  void loadSprite();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sheet = await _loadSpriteSheet();
    loadSprite();
    add(sprite);
  }

  Future<SpriteSheet> _loadSpriteSheet() async {
    return SpriteSheet(
      image: await game.images.load(spritePath),
      srcSize: spriteSize,
    );
  }
}
