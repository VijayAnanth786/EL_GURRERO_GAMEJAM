import 'dart:ui';
import 'package:flame/components.dart';
import '../game/el_gurrero_game.dart';

/// Base enemy class that all enemy types extend.
/// Branch: enemies
class Enemy extends SpriteComponent with HasGameReference<ElGurreroGame> {
  double speed;
  int health;
  int attackPower;

  Enemy({
    this.speed = 80.0,
    this.health = 30,
    this.attackPower = 5,
    Vector2? position,
    Vector2? size,
  }) : super(
         position: position ?? Vector2.zero(),
         size: size ?? Vector2(40, 40),
         anchor: Anchor.center,
       );

  @override
  Future<void> onLoad() async {
    // TODO: Replace with actual enemy sprite
    // sprite = await game.loadSprite('enemy.png');
    paint.color = const Color(0xFFF44336); // Red placeholder
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Basic AI: move toward the player
    final player = game.player;
    final direction = (player.position - position).normalized();
    position.add(direction * speed * dt);
  }

  void takeDamage(int amount) {
    health -= amount;
    if (health <= 0) {
      onDeath();
    }
  }

  void onDeath() {
    removeFromParent();
    // TODO: Drop loot, play animation, etc.
  }
}
