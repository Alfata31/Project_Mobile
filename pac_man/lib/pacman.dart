// Irma Yastari

import 'package:flutter/material.dart';

// Widget PacmanDude bertanggung jawab untuk menampilkan karakter Pacman
class PacmanDude extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.all(2.0), // Menambahkan padding di sekitar gambar
      child: Image.asset(
        'lib/images/pacman.png', // Lokasi file gambar Pacman
        color: Colors.yellow, // Mewarnai gambar Pacman dengan warna kuning
      ),
    );
  }
}
