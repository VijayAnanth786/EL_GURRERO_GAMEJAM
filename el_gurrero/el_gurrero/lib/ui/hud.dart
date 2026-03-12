import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../game/el_gurrero_game.dart';

/// The in-game HUD overlay (health bar, score, etc.).
/// Branch: ui
class Hud extends PositionComponent with HasGameReference<ElGurreroGame> {
  late TextComponent _scoreText;
  late TextComponent _healthText;

  int score = 0;

  @override
  Future<void> onLoad() async {
    // Score display
    _scoreText = TextComponent(
      text: 'Score: 0',
      position: Vector2(20, 20),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 20,
          fontFamily: 'Arial',
        ),
      ),
    );
    add(_scoreText);

    // Health display
    _healthText = TextComponent(
      text: 'HP: 100',
      position: Vector2(20, 50),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Color(0xFF4CAF50),
          fontSize: 20,
          fontFamily: 'Arial',
        ),
      ),
    );
    add(_healthText);
  }

  @override
  void update(double dt) {
    super.update(dt);
    _scoreText.text = 'Score: $score';
    _healthText.text = 'HP: 100';
  }

  void addScore(int points) {
    score += points;
  }
}
