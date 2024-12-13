import 'package:flutter/material.dart';
import 'homepage.dart'; // Mengimpor halaman utama game

void main() {
  runApp(MyApp()); // Menjalankan aplikasi
}

// Widget utama aplikasi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pacman Game', // Menambahkan judul aplikasi
      debugShowCheckedModeBanner: false, // Menghapus banner debug
      theme: ThemeData.dark(), // Menambahkan tema gelap untuk aplikasi
      home: HomePage(), // Menentukan halaman awal aplikasi
    );
  }
}
