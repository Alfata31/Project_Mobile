// Raisa Hafizah

import 'package:flutter/material.dart';

// Widget MyPixel untuk menggambar sebuah elemen pixel di grid game
class MyPixel extends StatelessWidget {
  // Warna bagian dalam (inner) dan luar (outer), serta widget tambahan (child)
  final innerColor;
  final outerColor;
  final child;

  // Constructor untuk menerima parameter
  MyPixel({this.innerColor, this.outerColor, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0), // Padding antar pixel
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6), // Membulatkan sudut luar
        child: Container(
          padding: EdgeInsets.all(12), // Padding di dalam container luar
          color: outerColor, // Warna container luar
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10), // Membulatkan sudut dalam
            child: Container(
              color: innerColor, // Warna container dalam
              child: child, // Widget tambahan (jika ada)
            ),
          ),
        ),
      ),
    );
  }
}
