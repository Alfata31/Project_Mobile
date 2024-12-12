// Mengimpor pustaka yang berisi komponen UI Material Design seperti widget, tema, dan ikon.
import 'package:flutter/material.dart';

// Mendefinisikan kelas Ghost yang merupakan turunan dari StatelessWidget.
class Ghost extends StatelessWidget {
  // Menimpa (override) metode build dari StatelessWidget.
  @override
  Widget build(BuildContext context) {
    // Mengembalikan widget Padding untuk memberikan jarak di sekitar widget anaknya.
    return Padding(
      // Padding seragam sebesar 4 piksel di semua sisi.
      padding: const EdgeInsets.all(4.0),
      // Menampilkan gambar dari direktori aset lokal proyek.
      child: Image.asset('lib/images/ghost.png'),
    );
  }
}
