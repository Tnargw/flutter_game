import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter_game/game/assets.dart';
import 'package:flutter_game/game/hoppy_frog_game.dart';

class Background extends SpriteComponent with HasGameRef<HoppyFrogGame>{
  Background();

  // Adds the background image.
  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.sky);
    size = gameRef.size;
    sprite = Sprite(background);

  }
}