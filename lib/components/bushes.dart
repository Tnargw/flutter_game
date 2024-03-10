import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_game/game/assets.dart';
import 'package:flutter_game/game/configuration.dart';
import 'package:flutter_game/game/hoppy_frog_game.dart';

class Bushes extends ParallaxComponent<HoppyFrogGame> {
  Bushes();
  

  // Adds the parallax effect.
  @override Future<void> onLoad() async {
    final bushes = await  Flame.images.load(Assets.bushes);
    final treesThree = await  Flame.images.load(Assets.treesThree);
    final treesFour = await  Flame.images.load(Assets.treesFour);
    final treesFive = await  Flame.images.load(Assets.treesFive);

    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(treesThree, fill: LayerFill.none),
      ),
      ParallaxLayer(
        ParallaxImage(treesFour, fill: LayerFill.none),
      ),
      ParallaxLayer(
        ParallaxImage(treesFive, fill: LayerFill.none),
      ),
      ParallaxLayer(
        ParallaxImage(bushes, fill: LayerFill.none),
      ),
    ], baseVelocity: Vector2(20,0), );

  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}