import 'dart:math';
import 'package:flame/components.dart';
import '../game/el_gurrero_game.dart';
import 'enemy.dart';

/// Handles spawning enemies at intervals.
/// Branch: enemies
class EnemySpawner extends Component with HasGameReference<ElGurreroGame> {
  final double spawnInterval; // seconds between spawns
  double _timer = 0;
  final Random _random = Random();

  EnemySpawner({this.spawnInterval = 3.0});

  @override
  void update(double dt) {
    super.update(dt);
    _timer += dt;

    if (_timer >= spawnInterval) {
      _timer = 0;
      spawnEnemy();
    }
  }

  void spawnEnemy() {
    // Spawn at a random edge of the screen
    final side = _random.nextInt(4);
    final screenSize = game.size;
    Vector2 spawnPos;

    switch (side) {
      case 0: // top
        spawnPos = Vector2(_random.nextDouble() * screenSize.x, 0);
        break;
      case 1: // right
        spawnPos = Vector2(screenSize.x, _random.nextDouble() * screenSize.y);
        break;
      case 2: // bottom
        spawnPos = Vector2(_random.nextDouble() * screenSize.x, screenSize.y);
        break;
      default: // left
        spawnPos = Vector2(0, _random.nextDouble() * screenSize.y);
    }

    game.add(Enemy(position: spawnPos));
  }
}
