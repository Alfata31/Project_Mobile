// Muhammad Rasyid Wanandi

import 'package:flutter/material.dart';

// StatelessWidget untuk membuat widget kustom bernama "MyBarrier"
class MyBarrier extends StatelessWidget {
  // Deklarasi properti untuk warna bagian dalam, warna bagian luar, dan widget anak
  final innerColor; // Warna untuk bagian dalam
  final outerColor; // Warna untuk bagian luar
  final child; // Widget anak (opsional) yang akan ditempatkan di dalam MyBarrier

  // Constructor untuk menginisialisasi properti
  MyBarrier({this.innerColor, this.outerColor, this.child});

  // Fungsi build untuk membangun UI widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      // Memberikan padding luar sebesar 1.0 di sekitar widget
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        // Membuat sudut membulat dengan radius 6 untuk lapisan luar
        borderRadius: BorderRadius.circular(6),
        child: Container(
          // Memberikan padding di dalam container luar sebesar 12
          padding: EdgeInsets.all(12),
          color:
              outerColor, // Memberikan warna latar belakang untuk container luar
          child: ClipRRect(
            // Membuat sudut membulat dengan radius 10 untuk lapisan dalam
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color:
                  innerColor, // Memberikan warna latar belakang untuk container dalam
              child:
                  child, // Menempatkan widget anak (jika ada) di dalam container
            ),
          ),
        ),
      ),
    );
  }
}
