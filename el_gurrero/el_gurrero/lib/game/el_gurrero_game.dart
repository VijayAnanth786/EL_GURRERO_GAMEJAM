import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import '../map/game_map.dart';

/// The main Flame game class that ties everything together.
class ElGurreroGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF87CEEB); // Sky blue background

  @override
  Future<void> onLoad() async {
    // Center the camera on the map center
    // Map is 32x32 tiles of 32px => 1024x1024 pixels
    camera.viewfinder.position = Vector2(512, 512);
    camera.viewfinder.anchor = Anchor.center;

    // Load the tiled map
    await world.add(GameMap());
  }
}
