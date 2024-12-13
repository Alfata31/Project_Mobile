// Aro Fakhrur Riziq

import 'package:flutter/material.dart';

// StatelessWidget untuk membuat widget kustom bernama 'Ghost'
class Ghost extends StatelessWidget {
  // Konstruktor default tanpa properti tambahan
  const Ghost({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Memberikan jarak di sekitar widget gambar sebesar 4.0
      padding: const EdgeInsets.all(4.0),
      child: Image.asset(
        // Menampilkan gambar dari folder 'lib/images'
        'lib/images/ghost.png', // Lokasi gambar 'ghost'
      ),
    );
  }
}
