import 'package:flutter/material.dart';

/// Shown when the player dies.
/// Branch: ui
class GameOverScreen extends StatelessWidget {
  final int score;
  final VoidCallback onRestart;
  final VoidCallback onMainMenu;

  const GameOverScreen({
    super.key,
    required this.score,
    required this.onRestart,
    required this.onMainMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'GAME OVER',
              style: TextStyle(
                color: Colors.red,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Score: $score',
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: onRestart, child: const Text('RESTART')),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onMainMenu,
              child: const Text('MAIN MENU'),
            ),
          ],
        ),
      ),
    );
  }
}
