import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter_game/components/animated_frog.dart';
import 'package:flutter_game/components/background.dart';
import 'package:flutter_game/components/bushes.dart';
import 'package:flutter_game/components/ground.dart';
import 'package:flutter_game/components/pipe_group.dart';
import 'package:flutter_game/game/assets.dart';
import 'package:flutter_game/game/configuration.dart';
import 'package:flutter/material.dart';

class HoppyFrogGame extends FlameGame with TapDetector, HasCollisionDetection {
  late AnimatedFrog animatedFrog;
  late TextComponent score;

  var frogChoice = Assets.animatedFrog;

  @override
  // TODO: implement debugMode
  bool get debugMode => super.debugMode = true;

  // A timer to keep track of game time.
  Timer interval = Timer(Config.pipeInterval, repeat: true);

  bool isHit = false;



  // Setup for the game.
  @override
  Future<void> onLoad() async {
    // Sets the game to fullscreen, and landscape mode.
    Flame.device.fullScreen();
    Flame.device.setLandscape();

    // Adds assets to the game.
    addAll([
      Background(),
      Bushes(),
      Ground(),
      animatedFrog = AnimatedFrog(),
      score = buildScore()
    ]);

    // Initiates the main menu.
    mainMenu();

    interval.onTick = () => add(PipeGroup());

  }

  changeFrog(){
    remove(animatedFrog);

    add(animatedFrog = AnimatedFrog());
  }


  // Builds the "Score" component.
  TextComponent buildScore() {
    return TextComponent(
      text:  'Score: 0',
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 72,
          fontWeight:  FontWeight.bold, fontFamily: 'Game'
        )
      )
    );
  }

  // Makes the frog hop when the screen is tapped.
  @override
  void onTap() {
    super.onTap();
    animatedFrog.hop();
  }

  // Updates the game time and the score.
  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);

    score.text = 'Score: ${animatedFrog.score}';
  }

  // When called overlays the main menu.
  void mainMenu() {
    overlays.add('mainMenu');
    pauseEngine();
  }

}