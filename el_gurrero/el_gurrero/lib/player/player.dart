import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import '../game/el_gurrero_game.dart';

/// The main player character component.
/// Branch: player
class Player extends SpriteComponent
    with KeyboardHandler, HasGameReference<ElGurreroGame> {
  // Movement speed in pixels per second
  double speed = 200.0;

  // Movement direction
  final Vector2 _direction = Vector2.zero();

  Player() : super(size: Vector2(48, 48), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    // TODO: Replace with actual player sprite
    // sprite = await game.loadSprite('player.png');

    // Placeholder: colored rectangle (will render as white box)
    paint.color = const Color(0xFF4CAF50);
    position = game.size / 2; // Start at center of screen
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.add(_direction.normalized() * speed * dt);

    // Clamp player within screen bounds
    position.clamp(Vector2(size.x / 2, size.y / 2), game.size - size / 2);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    _direction.setZero();

    if (keysPressed.contains(LogicalKeyboardKey.keyW) ||
        keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      _direction.y -= 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyS) ||
        keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      _direction.y += 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      _direction.x -= 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      _direction.x += 1;
    }

    return true;
  }

  /// Called when the player takes damage.
  void takeDamage(int amount) {
    // TODO: Implement health system
  }

  /// Called when the player attacks.
  void attack() {
    // TODO: Implement attack logic
  }
}
