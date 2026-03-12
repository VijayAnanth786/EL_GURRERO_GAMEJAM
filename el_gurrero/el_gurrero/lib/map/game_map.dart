import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

/// The game world/map component.
class GameMap extends Component {
  @override
  Future<void> onLoad() async {
    final tiledMap = await TiledComponent.load(
      'vinland_map.tmx',
      Vector2.all(32),
    );
    add(tiledMap);
  }
}
