import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tetris/board_provider.dart';
import 'package:tetris/view/game_board.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => GameBoardProvider(),
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameBoard(),
    );
  }
}
