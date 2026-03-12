import 'package:flame/events.dart';
import 'package:flame/game.dart';
import '../player/player.dart';
import '../player/player_stats.dart';
import '../enemies/enemy_spawner.dart';
import '../map/game_map.dart';
import '../ui/hud.dart';

/// The main Flame game class that ties everything together.
class ElGurreroGame extends FlameGame with HasKeyboardHandlerComponents {
  late Player player;
  late PlayerStats playerStats;
  late Hud hud;

  @override
  Future<void> onLoad() async {
    playerStats = PlayerStats();

    // Add map first (renders at bottom)
    await add(GameMap());

    // Add player
    player = Player();
    await add(player);

    // Add enemy spawner
    await add(EnemySpawner());

    // Add HUD on top
    hud = Hud();
    await add(hud);
  }
}
