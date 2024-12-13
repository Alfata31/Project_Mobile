// Muhammad Alfata

import 'dart:async'; // Digunakan untuk fungsi timer
import 'dart:math'; // Digunakan untuk perhitungan sudut rotasi
import 'package:flutter/material.dart';
import 'package:pac_man/pacman.dart';
import 'barriers.dart'; // Custom widget untuk elemen penghalang
import 'ghost.dart'; // Custom widget untuk karakter hantu
import 'pixel.dart'; // Custom widget untuk elemen grid

// Widget HomePage merupakan layar utama game Pacman
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// State untuk widget HomePage
class _HomePageState extends State<HomePage> {
  // Konfigurasi permainan
  static int numberInRow = 11; // Jumlah kotak per baris
  static int numberOfSquares = numberInRow * 17; // Total jumlah kotak di grid
  int player = 166; // Posisi awal pemain (Pacman)
  int ghost = 21; // Posisi awal hantu
  bool mouthClosed = true; // Status mulut Pacman (buka/tutup)
  int score = 0; // Skor pemain

  // Daftar posisi elemen penghalang di grid
  static List<int> barriers = [
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 22, 33, 44, // ...
    // Tambahan elemen lainnya...
  ];

  // Daftar posisi makanan yang bisa dimakan Pacman
  List<int> food = [];

  // Mengisi daftar makanan (semua posisi grid kecuali penghalang)
  void getFood() {
    for (int i = 0; i < numberOfSquares; i++) {
      if (!barriers.contains(i)) {
        food.add(i);
      }
    }
  }

  // Arah gerakan Pacman
  String direction = "right";
  bool gameStarted = false; // Status apakah permainan sudah dimulai

  // Fungsi untuk memulai permainan
  void startGame() {
    if (!gameStarted) {
      moveGhost(); // Memulai pergerakan hantu
      gameStarted = true; // Menandai bahwa permainan telah dimulai
      getFood(); // Mengisi daftar makanan
      Timer.periodic(Duration(milliseconds: 200), (timer) {
        mouthClosed =
            !mouthClosed; // Membuka/menutup mulut Pacman secara berkala

        // Jika Pacman memakan makanan, hapus makanan dan tambahkan skor
        if (food.contains(player)) {
          food.remove(player);
          score++;
        }

        // Jika Pacman bertabrakan dengan hantu, permainan berakhir
        if (player == ghost) {
          timer.cancel();
          _showGameOverDialog();
        }

        // Jika semua makanan habis, permainan selesai
        if (food.isEmpty) {
          timer.cancel();
          _showGameCompletedDialog();
        }

        // Memindahkan Pacman berdasarkan arah gerakan saat ini
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

  // Menampilkan dialog Game Over
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

  // Menampilkan dialog Game Completed
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

  // Mengatur ulang permainan
  void resetGame() {
    setState(() {
      player = 166; // Posisi awal Pacman
      ghost = 21; // Posisi awal hantu
      direction = "right"; // Arah default
      score = 0; // Skor kembali ke nol
      food.clear(); // Kosongkan makanan
      getFood(); // Isi ulang makanan
      gameStarted = false;
      mouthClosed = true;
    });
  }

  // Fungsi untuk memindahkan Pacman ke kanan
  void moveRight() {
    setState(() {
      if (!barriers.contains(player + 1) && (player + 1) % numberInRow != 0) {
        player += 1;
      }
    });
  }

  // Fungsi untuk memindahkan Pacman ke atas
  void moveUp() {
    setState(() {
      if (!barriers.contains(player - numberInRow)) {
        player -= numberInRow;
      }
    });
  }

  // Fungsi untuk memindahkan Pacman ke kiri
  void moveLeft() {
    setState(() {
      if (!barriers.contains(player - 1) && player % numberInRow != 0) {
        player -= 1;
      }
    });
  }

  // Fungsi untuk memindahkan Pacman ke bawah
  void moveDown() {
    setState(() {
      if (!barriers.contains(player + numberInRow)) {
        player += numberInRow;
      }
    });
  }

  // Fungsi untuk memindahkan ghost untuk mengejar pacman
  void moveGhost() {
    Timer.periodic(Duration(milliseconds: 500), (timer) {
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
        int newGhost = possibleMoves.reduce(
          (a, b) => (player - a).abs() < (player - b).abs() ? a : b,
        );
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
      backgroundColor: Colors.black, // Latar belakang hitam
      body: Column(
        children: [
          // Area permainan grid
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
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: numberOfSquares,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: numberInRow,
                ),
                itemBuilder: (BuildContext context, int index) {
                  // Menampilkan Pacman
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
                    // Menampilkan hantu
                    return Ghost();
                  } else if (barriers.contains(index)) {
                    // Menampilkan penghalang
                    return MyBarrier(
                      innerColor: Colors.blue[800],
                      outerColor: Colors.blue[900],
                    );
                  } else if (food.contains(index)) {
                    // Menampilkan makanan
                    return MyPixel(
                      innerColor: Colors.yellow,
                      outerColor: Colors.black,
                    );
                  } else {
                    // Menampilkan elemen kosong
                    return MyPixel(
                      innerColor: Colors.black,
                      outerColor: Colors.black,
                    );
                  }
                },
              ),
            ),
          ),
          // Menampilkan skor
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Score: $score",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          // Tombol Mulai Ulang
          ElevatedButton(
            onPressed: resetGame,
            child: Text("Restart"),
          ),
        ],
      ),
    );
  }
}
