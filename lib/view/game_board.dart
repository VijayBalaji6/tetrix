import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tetris/board_provider.dart';
import 'package:tetris/constants.dart';
import 'package:tetris/view/blocks.dart';
import 'package:tetris/view/game_controller_buttons.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<GameBoardProvider>(
        builder: (BuildContext context, boardProvider, Widget? child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your score ${boardProvider.currentScore.toString()}",
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  getIcon(
                    iconName: Icons.settings,
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: rowLength * columnLength,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: rowLength),
                    itemBuilder: (BuildContext context, int value) {
                      int curRow = (value / rowLength).floor();
                      int curCol = value % rowLength;
                      if (boardProvider.currentPiece.position.contains(value)) {
                        return Block(
                          blockColor: Colors.red[100]!,
                          number: value,
                        );
                      } else if (boardProvider.gameBoard[curRow][curCol] !=
                          null) {
                        return Block(
                          blockColor: Colors.blue[800]!,
                          number: value,
                        );
                      } else {
                        return Block(
                          blockColor: Colors.grey[800]!,
                          number: value,
                        );
                      }
                    }),
              ),
              const GameControllerButtons()
            ],
          );
        },
      ),
    );
  }
}
