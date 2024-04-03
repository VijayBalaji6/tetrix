import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris/constants.dart';
import 'package:tetris/tetris_blocks.dart';

class GameBoardProvider extends ChangeNotifier {
  GameBoardProvider() {
    startGame();
  }

// Game board Data
  List<List<TetrisBlocks?>> gameBoard =
      List.generate(columnLength, (i) => List.generate(rowLength, (j) => null));

  // current Tetris piece
  TetrisPiece currentPiece = TetrisPiece(blockType: TetrisBlocks.I);

  int currentScore = 0;

// Start the game
  void startGame() {
    currentPiece.initializeBlock();
    Duration frameRate = const Duration(milliseconds: 800);
    gameLoop(frameRate);
  }

  // game loop
  void gameLoop(Duration frameRateDuration) {
    Timer.periodic(frameRateDuration, (timer) {
      //check Landing
      checkLanding();
      // move current block to down
      currentPiece.moveBlocks(Directions.down);
      notifyListeners();
    });
  }

  // check for collusion detection - stop box out of range
  bool checkCollision(Directions directions) {
    for (int i = 0; i < currentPiece.position.length; i++) {
      int curRow = (currentPiece.position[i] / rowLength).floor();
      int curCol = currentPiece.position[i] % rowLength;
      if (directions == Directions.left) {
        curCol -= 1;
      } else if (directions == Directions.right) {
        curCol += 1;
      } else if (directions == Directions.down) {
        curRow += 1;
      }
      // check if the piece is out of bound
      if (curRow >= columnLength || curCol < 0 || curCol >= rowLength) {
        return true;
      }
    }
    return false;
  }

  void checkLanding() {
    if (checkCollision(Directions.down)) {
      for (int i = 0; i < currentPiece.position.length; i++) {
        int curRow = (currentPiece.position[i] / rowLength).floor();
        int curCol = currentPiece.position[i] % rowLength;
        if (curRow >= 0 && curCol >= 0) {
          gameBoard[curRow][curCol] = currentPiece.blockType;
        }
      }
      createNewBlocks();
    }
  }

  void createNewBlocks() {
    // create a random block
    Random random = Random();
    TetrisBlocks randomBlock =
        TetrisBlocks.values[random.nextInt(TetrisBlocks.values.length)];
    currentPiece = TetrisPiece(blockType: randomBlock);
    currentPiece.initializeBlock();
  }

  void moveLeft() {
    if (!checkCollision(Directions.left)) {
      currentPiece.moveBlocks(Directions.left);
      notifyListeners();
    }
  }

  void moveDown() {
    if (!checkCollision(Directions.down)) {
      currentPiece.moveBlocks(Directions.down);
      notifyListeners();
    }
  }

  void moveRight() {
    if (!checkCollision(Directions.right)) {
      currentPiece.moveBlocks(Directions.right);
      notifyListeners();
    }
  }

  void moveRotate() {
    currentPiece.rotateBlock(gameBoard);
    notifyListeners();
  }

  void clearLine() {
    for (int row = columnLength - 1; row >= 0; row--) {
      bool rowIsFull = true;
      for (int col = 0; col < rowLength; col++) {
        if (gameBoard[row][col] == null) {
          rowIsFull = false;
          break;
        }
      }
      if (rowIsFull) {
        for (int r = row; r > 0; r--) {
          gameBoard[r] = List.from(gameBoard[r - 1]);
        }
      }
      gameBoard[0] = List.generate(row, (index) => null);

      currentScore++;
      notifyListeners();
    }
  }
}
