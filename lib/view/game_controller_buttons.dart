import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tetris/board_provider.dart';

class GameControllerButtons extends StatelessWidget {
  const GameControllerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final boardProvider = context.read<GameBoardProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getIcon(
          iconAction: () => boardProvider.moveLeft(),
          iconName: Icons.arrow_circle_left_outlined,
        ),
        getIcon(
          iconAction: () => boardProvider.moveDown(),
          iconName: Icons.arrow_circle_down_outlined,
        ),
        getIcon(
          iconAction: () => boardProvider.moveRight(),
          iconName: Icons.arrow_circle_right_outlined,
        ),
        getIcon(
          iconAction: () => boardProvider.moveRotate(),
          iconName: Icons.rotate_left,
        ),
      ],
    );
  }
}

IconButton getIcon({VoidCallback? iconAction, required IconData iconName}) {
  return IconButton(
    onPressed: iconAction,
    icon: Icon(
      size: 40,
      iconName,
      color: Colors.white,
    ),
  );
}
