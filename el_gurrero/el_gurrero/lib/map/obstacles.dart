import 'dart:ui';
import 'package:flame/components.dart';

/// Static obstacles in the map that block movement.
/// Branch: map
class Obstacle extends RectangleComponent {
  Obstacle({required Vector2 position, required Vector2 size})
    : super(
        position: position,
        size: size,
        anchor: Anchor.center,
        paint: Paint()..color = const Color(0xFF795548), // Brown
      );
}

/// Helper to create a set of obstacles for a level.
class ObstacleManager extends Component {
  @override
  Future<void> onLoad() async {
    // TODO: Load obstacle positions from level data
    // Example obstacles:
    add(Obstacle(position: Vector2(200, 200), size: Vector2(60, 60)));
    add(Obstacle(position: Vector2(500, 300), size: Vector2(80, 40)));
    add(Obstacle(position: Vector2(350, 500), size: Vector2(40, 80)));
  }
}
