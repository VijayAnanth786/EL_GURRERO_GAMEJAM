import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'game/el_gurrero_game.dart';
import 'ui/intro_video_screen.dart';
import 'ui/main_menu.dart';
import 'ui/map_screen.dart';
import 'ui/game_over_screen.dart';

void main() {
  runApp(const ElGurreroApp());
}

class ElGurreroApp extends StatefulWidget {
  const ElGurreroApp({super.key});

  @override
  State<ElGurreroApp> createState() => _ElGurreroAppState();
}

enum GameScreen { menu, map, intro, playing, gameOver }

class _ElGurreroAppState extends State<ElGurreroApp> {
  GameScreen _screen = GameScreen.map;
  ElGurreroGame? _game;
  final int _lastScore = 0;

  void _goToMenu() {
    setState(() {
      _screen = GameScreen.menu;
    });
  }

  void _goToIntro() {
    setState(() {
      _screen = GameScreen.intro;
    });
  }

  void _startGame() {
    setState(() {
      _game = ElGurreroGame();
      _screen = GameScreen.playing;
    });
  }

  void _resetToMenu() {
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
      case GameScreen.map:
        return MapScreen(onEnter: _goToIntro);
      case GameScreen.intro:
        return IntroVideoScreen(onFinished: _goToMenu);
      case GameScreen.menu:
        return MainMenu(onPlay: _startGame);
      case GameScreen.playing:
        return GameWidget(game: _game!);
      case GameScreen.gameOver:
        return GameOverScreen(
          score: _lastScore,
          onRestart: _startGame,
          onMainMenu: _resetToMenu,
        );
    }
  }
}
