import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pacman/pacman.dart';
import 'barriers.dart';
import 'ghost.dart';
import 'pixel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberOfSquares = numberInRow * 17;
  static int numberInRow = 11;
  int player = 166;
  int ghost = 21;
  bool mouthClosed = true;
  int score = 0;

  static List<int> barriers = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    22,
    33,
    44,
    55,
    66,
    77,
    99,
    110,
    121,
    132,
    143,
    154,
    165,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    175,
    164,
    153,
    142,
    131,
    120,
    109,
    87,
    76,
    65,
    54,
    43,
    32,
    21,
    78,
    79,
    80,
    100,
    101,
    102,
    84,
    85,
    86,
    106,
    107,
    108,
    24,
    35,
    46,
    57,
    30,
    41,
    52,
    63,
    81,
    70,
    59,
    61,
    72,
    83,
    26,
    28,
    37,
    38,
    39,
    123,
    134,
    145,
    156,
    129,
    140,
    151,
    162,
    103,
    114,
    125,
    105,
    116,
    127,
    147,
    148,
    149,
    158,
    160
  ];

  List<int> food = [];

  void getFood() {
    for (int i = 0; i < numberOfSquares; i++) {
      if (!barriers.contains(i)) {
        food.add(i);
      }
    }
  }

  String direction = "right";
  bool gameStarted = false;

  void startGame() {
    if (!gameStarted) {
      moveGhost();
      gameStarted = true;
      getFood();
      Duration duration = Duration(milliseconds: 200);
      Timer.periodic(duration, (timer) {
        mouthClosed = !mouthClosed;

        if (food.contains(player)) {
          food.remove(player);
          score++;
        }

        if (player == ghost) {
          timer.cancel();
          _showGameOverDialog();
        }

        if (food.isEmpty) {
          timer.cancel();
          _showGameCompletedDialog();
        }

        switch (direction) {
          case "right":
            moveRight();
            break;
          case "up":
            moveUp();
            break;
          case "left":
            moveLeft();
            break;
          case "down":
            moveDown();
            break;
        }
      });
    }
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('Your Score: $score'),
          actions: <Widget>[
            TextButton(
              child: Text('Play Again'),
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
            ),
          ],
        );
      },
    );
  }

  void _showGameCompletedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Completed'),
          content: Text('Congratulations! You have eaten all the points.'),
          actions: <Widget>[
            TextButton(
              child: Text('Play Again'),
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
            ),
          ],
        );
      },
    );
  }

  void resetGame() {
    setState(() {
      player = 166;
      ghost = 21;
      direction = "right";
      score = 0;
      food.clear();
      getFood();
      gameStarted = false;
      mouthClosed = true;
    });
  }

  void moveRight() {
    setState(() {
      if (!barriers.contains(player + 1) && (player + 1) % numberInRow != 0) {
        player += 1;
      }
    });
  }

  void moveUp() {
    setState(() {
      if (!barriers.contains(player - numberInRow)) {
        player -= numberInRow;
      }
    });
  }

  void moveLeft() {
    setState(() {
      if (!barriers.contains(player - 1) && player % numberInRow != 0) {
        player -= 1;
      }
    });
  }

  void moveDown() {
    setState(() {
      if (!barriers.contains(player + numberInRow)) {
        player += numberInRow;
      }
    });
  }

  void moveGhost() {
    Duration ghostSpeed = Duration(milliseconds: 500);
    Timer.periodic(ghostSpeed, (timer) {
      if (!gameStarted || player == ghost) {
        timer.cancel();
        return;
      }

      List<int> possibleMoves = [];
      if (!barriers.contains(ghost - numberInRow)) {
        possibleMoves.add(ghost - numberInRow);
      }
      if (!barriers.contains(ghost + numberInRow)) {
        possibleMoves.add(ghost + numberInRow);
      }
      if (!barriers.contains(ghost - 1) && ghost % numberInRow != 0) {
        possibleMoves.add(ghost - 1);
      }
      if (!barriers.contains(ghost + 1) && (ghost + 1) % numberInRow != 0) {
        possibleMoves.add(ghost + 1);
      }

      if (possibleMoves.isNotEmpty) {
        int newGhost = possibleMoves
            .reduce((a, b) => (player - a).abs() < (player - b).abs() ? a : b);
        setState(() {
          ghost = newGhost;
        });
      }

      if (player == ghost) {
        timer.cancel();
        _showGameOverDialog();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Area permainan
          Expanded(
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0) {
                  direction = "down";
                } else if (details.delta.dy < 0) {
                  direction = "up";
                }
              },
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0) {
                  direction = "right";
                } else if (details.delta.dx < 0) {
                  direction = "left";
                }
              },
              child: Container(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: numberOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: numberInRow,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (player == index) {
                      if (!mouthClosed) {
                        return Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow,
                            ),
                          ),
                        );
                      } else {
                        if (direction == "right") {
                          return PacmanDude();
                        } else if (direction == "up") {
                          return Transform.rotate(
                            angle: 3 * pi / 2,
                            child: PacmanDude(),
                          );
                        } else if (direction == "left") {
                          return Transform.rotate(
                            angle: pi,
                            child: PacmanDude(),
                          );
                        } else if (direction == "down") {
                          return Transform.rotate(
                            angle: pi / 2,
                            child: PacmanDude(),
                          );
                        }
                      }
                    } else if (ghost == index) {
                      return Ghost();
                    } else if (barriers.contains(index)) {
                      return MyBarrier(
                        innerColor: Colors.blue[800],
                        outerColor: Colors.blue[900],
                      );
                    } else if (food.contains(index) || !gameStarted) {
                      return MyPixel(
                        innerColor: Colors.yellow,
                        outerColor: Colors.black,
                      );
                    } else {
                      return MyPixel(
                        innerColor: Colors.black,
                        outerColor: Colors.black,
                      );
                    }
                  },
                ),
              ),
            ),
          ),

          // Bagian bawah: Score dan tombol Play
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skor
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Score: $score',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),

                // Tombol Play
                GestureDetector(
                  onTap: startGame,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      gameStarted ? "" : "P L A Y",
                      style: TextStyle(color: Colors.grey[300], fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
