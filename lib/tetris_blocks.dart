import 'package:tetris/constants.dart';

class TetrisPiece {
  TetrisPiece({required this.blockType});

  final TetrisBlocks blockType;
  List<int> position = [];
  int rotationState = 1;

  void initializeBlock() {
    switch (blockType) {
      case TetrisBlocks.L:
        position = [-26, -16, -6, -5];
        break;
      case TetrisBlocks.J:
        position = [-25, -15, -5, -6];
        break;
      case TetrisBlocks.I:
        position = [-4, -5, -6, -7];
        break;
      case TetrisBlocks.O:
        position = [-15, -14, -5, -4];
        break;
      case TetrisBlocks.S:
        position = [-15, -14, -6, -5];
        break;
      case TetrisBlocks.Z:
        position = [-17, -16, -6, -5];
        break;
      case TetrisBlocks.T:
        position = [-26, -16, -6, -15];
        break;
      default:
        break;
    }
  }

  // Move blocks

  void moveBlocks(Directions direction) {
    switch (direction) {
      case Directions.down:
        for (int i = 0; i < position.length; i++) {
          position[i] += 10;
        }
        break;
      case Directions.right:
        for (int i = 0; i < position.length; i++) {
          position[i]++;
        }
        break;
      case Directions.left:
        for (int i = 0; i < position.length; i++) {
          position[i]--;
        }
        break;
      default:
    }
  }

  void rotateBlock(List<List<TetrisBlocks?>> gameBoard) {
    List<int> newPosition = [];
    switch (blockType) {
      case TetrisBlocks.L:
        switch (rotationState) {
          case 0:
            newPosition = [
              position[1] - rowLength,
              position[1],
              position[1] + rowLength,
              position[1] + rowLength + 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + rowLength - 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] + rowLength,
              position[1],
              position[1] - rowLength,
              position[1] - rowLength - 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] - rowLength + 1,
              position[1],
              position[1] + 1,
              position[1] - 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState = 0;
            }

            break;
        }
        break;
      case TetrisBlocks.J:
        switch (rotationState) {
          case 0:
            newPosition = [
              position[1] - rowLength,
              position[1],
              position[1] + rowLength,
              position[1] + rowLength - 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[1] - rowLength - 1,
              position[1],
              position[1] - 1,
              position[1] + 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] + rowLength,
              position[1],
              position[1] - rowLength,
              position[1] - rowLength + 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] + 1,
              position[1],
              position[1] - 1,
              position[1] + rowLength + 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState = 0;
            }
            break;
        }
        break;
      case TetrisBlocks.I:
        switch (rotationState) {
          case 0:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + 2,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[1] + rowLength,
              position[1],
              position[1] + rowLength,
              position[1] - 2 * rowLength,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] + 1,
              position[1],
              position[1] - 1,
              position[1] - 2,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] + rowLength,
              position[1],
              position[1] - rowLength,
              position[1] - 2 * rowLength,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState = 0;
            }
            break;
        }
        break;

      case TetrisBlocks.O:
        break;
      case TetrisBlocks.S:
        switch (rotationState) {
          case 0:
            newPosition = [
              position[1],
              position[1] + 1,
              position[1] + rowLength - 1,
              position[1] + rowLength,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[0] - rowLength,
              position[0],
              position[0] + 1,
              position[0] + rowLength + 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1],
              position[1] + 1,
              position[1] + rowLength - 1,
              position[1] + rowLength,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[0] - rowLength,
              position[0],
              position[0] + 1,
              position[0] + rowLength + 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState = 0;
            }
            break;
        }
        break;
      case TetrisBlocks.Z:
        switch (rotationState) {
          case 0:
            newPosition = [
              position[0] + rowLength - 2,
              position[1],
              position[2] + rowLength - 1,
              position[3] + 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[0] - rowLength + 2,
              position[1],
              position[2] - rowLength + 1,
              position[3] - 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[0] + rowLength - 2,
              position[1],
              position[2] + rowLength - 1,
              position[3] + 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[0] - rowLength + 2,
              position[1],
              position[2] + rowLength + 1,
              position[3] - 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState = 0;
            }
            break;
        }
        break;
      case TetrisBlocks.T:
        switch (rotationState) {
          case 0:
            newPosition = [
              position[2] - rowLength,
              position[2],
              position[2] + 1,
              position[2] + rowLength,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + rowLength,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] - rowLength,
              position[1] - 1,
              position[1],
              position[1] + 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState += (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[2] - rowLength,
              position[2] - 1,
              position[2],
              position[2] + 1,
            ];
            if (blockPositionIsValid(newPosition, gameBoard)) {
              position = newPosition;
              rotationState = 0;
            }
            break;
        }
        break;
      default:
        break;
    }
  }

  bool isPositionValidForRotation(
      int position, List<List<TetrisBlocks?>> gameBoard) {
    int row = (position / rowLength).floor();
    int col = position % rowLength;

    if (row < 0 || col < 0 || gameBoard[row][col] != null) {
      return false;
    } else {
      return true;
    }
  }

  bool blockPositionIsValid(
      List<int> blockPosition, List<List<TetrisBlocks?>> gameBoard) {
    bool firstColOccupied = false;
    bool lastColOccupied = false;
    for (int position in blockPosition) {
      if (!isPositionValidForRotation(position, gameBoard)) {
        return false;
      }
      int col = position % rowLength;
      if (col == 0) {
        firstColOccupied = true;
      }
      if (col == rowLength - 1) {
        lastColOccupied = true;
      }
    }
    return !(firstColOccupied && lastColOccupied);
  }
}
