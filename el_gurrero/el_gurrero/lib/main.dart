import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'game/el_gurrero_game.dart';
import 'ui/main_menu.dart';
import 'ui/game_over_screen.dart';

void main() {
  runApp(const ElGurreroApp());
}

class ElGurreroApp extends StatefulWidget {
  const ElGurreroApp({super.key});

  @override
  State<ElGurreroApp> createState() => _ElGurreroAppState();
}

enum GameScreen { menu, playing, gameOver }

class _ElGurreroAppState extends State<ElGurreroApp> {
  GameScreen _screen = GameScreen.menu;
  ElGurreroGame? _game;
  final int _lastScore = 0;

  void _startGame() {
    setState(() {
      _game = ElGurreroGame();
      _screen = GameScreen.playing;
    });
  }

  void _goToMenu() {
    setState(() {
      _screen = GameScreen.menu;
      _game = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'El Gurrero',
      theme: ThemeData.dark(),
      home: _buildScreen(),
    );
  }

  Widget _buildScreen() {
    switch (_screen) {
      case GameScreen.menu:
        return MainMenu(onPlay: _startGame);
      case GameScreen.playing:
        return GameWidget(game: _game!);
      case GameScreen.gameOver:
        return GameOverScreen(
          score: _lastScore,
          onRestart: _startGame,
          onMainMenu: _goToMenu,
        );
    }
  }
}
