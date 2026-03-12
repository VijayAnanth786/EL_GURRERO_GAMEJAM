import 'dart:ui';
import 'package:flame/components.dart';
import '../game/el_gurrero_game.dart';

/// The game world/map component.
/// Branch: map
class GameMap extends Component with HasGameReference<ElGurreroGame> {
  @override
  Future<void> onLoad() async {
    // TODO: Load tile map or background
    // For now, add a simple background rectangle
    add(MapBackground(size: game.size));
  }
}

/// Simple colored background as a placeholder.
class MapBackground extends RectangleComponent {
  MapBackground({required Vector2 size})
    : super(
        size: size,
        paint: Paint()..color = const Color(0xFF2E7D32), // Dark green
        priority: -1, // Render behind everything
      );
}
