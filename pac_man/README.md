# 📜 **Deskripsi Fungsi dan Analisis Kode Permainan PACMAN Flutter** 🎮

Deskripsi dari setiap bagian kode proyek PACMAN yang dikembangkan menggunakan *Flutter*.
---

## 🧱 **1. Widget MyBarrier**

🔹 **Fungsi:**  
`MyBarrier` digunakan untuk membuat rintangan (barrier) di area permainan PACMAN.

🔹 **Detail:**
- **Lapisan Warna:** Rintangan memiliki dua lapisan warna, yaitu:
  - **Warna Luar (outerColor)**: Memberikan batasan luar.
  - **Warna Dalam (innerColor)**: Memberikan warna bagian dalam.
- **Sudut Membulat:** Menggunakan `borderRadius` untuk membuat sudut membulat, memberikan tampilan yang lebih halus.
- **Efek Padding:** Memberikan jarak antar rintangan agar tidak terlihat menempel langsung di grid.

🔹 **Peran di Permainan:**  
Menentukan batasan yang tidak dapat dilewati oleh pemain maupun hantu, sehingga menciptakan labirin permainan.

---

## 👻 **2. Widget Ghost**

🔹 **Fungsi:**  
`Ghost` menampilkan karakter hantu di permainan PACMAN.

🔹 **Detail:**
- **Gambar Hantu:** Menggunakan gambar dari direktori lokal (`lib/images/ghost.png`).
- **Padding:** Memberikan jarak di sekitar hantu agar tampilannya lebih baik di dalam grid.

🔹 **Peran di Permainan:**  
Karakter ini menjadi lawan yang harus dihindari oleh pemain. Jika pemain bertemu dengan hantu, permainan berakhir.

---

## 🏠 **3. HomePage**

🔹 **Fungsi Utama:**  
`HomePage` mengontrol seluruh logika permainan PACMAN. Ini adalah inti dari permainan yang mengatur berbagai aspek seperti pergerakan pemain, pergerakan hantu, skor, dan kondisi permainan.

### 🔧 **Fitur Utama di HomePage:**

1. **🎯 Logika Pergerakan Pemain:**
   - Pemain dapat bergerak ke **kanan**, **kiri**, **atas**, dan **bawah**.
   - Fungsi seperti `moveRight`, `moveUp`, `moveLeft`, dan `moveDown` memastikan pemain tidak menabrak rintangan.

2. **👻 Pergerakan Hantu:**
   - Hantu bergerak secara otomatis menggunakan fungsi `moveGhost`.
   - Hantu akan mencari jalan yang mendekati posisi pemain.

3. **🚀 Permulaan Permainan:**
   - Fungsi `startGame` memulai permainan dan mengatur timer agar permainan berjalan terus-menerus hingga kondisi tertentu tercapai.

4. **🏆 Penghitungan Skor:**
   - Skor bertambah setiap kali pemain memakan titik makanan.
   - Skor ditampilkan di bagian bawah layar.

5. **🎲 Kondisi Permainan:**
   - **Game Over:** Ditampilkan jika pemain bertemu dengan hantu.
   - **Game Completed:** Ditampilkan jika semua makanan telah dikumpulkan.

6. **🔄 Reset Permainan:**
   - Fungsi `resetGame` mengembalikan permainan ke kondisi awal.

7. **🕹️ Kontrol Interaktif:**
   - Pemain dapat mengontrol PACMAN dengan **gestur geser** (ke atas, bawah, kiri, atau kanan).

---

## 🔶 **4. Widget MyPixel**

🔹 **Fungsi:**  
`MyPixel` digunakan untuk menampilkan elemen grid seperti titik makanan atau area kosong.

🔹 **Detail:**
- **Lapisan Warna:** Memiliki warna dalam (innerColor) dan warna luar (outerColor).
- **Efek Padding:** Memberikan jarak antar elemen untuk menciptakan tampilan grid yang rapi.

🔹 **Peran di Permainan:**  
Menyediakan visual untuk area permainan dan titik makanan yang dapat dikumpulkan oleh pemain.

---

## 🚀 **5. Fungsi Main (MyApp)**

🔹 **Fungsi:**  
Menjalankan aplikasi Flutter dan menampilkan `HomePage` sebagai halaman utama permainan.

🔹 **Detail:**
- Menggunakan `MaterialApp` sebagai kerangka utama aplikasi.
- **Debug Mode:** Menonaktifkan label debug dengan `debugShowCheckedModeBanner: false`.

🔹 **Peran di Permainan:**  
Menjadi titik masuk utama aplikasi, memastikan permainan dijalankan dengan tampilan yang diinginkan.

---

## 🟡 **6. Widget PacmanDude**

🔹 **Fungsi:**  
`PacmanDude` menampilkan karakter pemain PACMAN.

🔹 **Detail:**
- **Gambar PACMAN:** Diambil dari direktori lokal (`lib/images/pacman.png`).
- **Warna Kuning:** Memberikan warna kuning khas karakter PACMAN.
- **Padding:** Memberikan jarak agar PACMAN tampil lebih rapi di grid.

🔹 **Peran di Permainan:**  
Menjadi karakter utama yang dikendalikan oleh pemain untuk mengumpulkan poin dan menghindari hantu.

---

### 🕹️ **Kesimpulan**

Permainan PACMAN ini menggunakan komponen-komponen utama seperti **MyBarrier**, **Ghost**, **MyPixel**, dan **PacmanDude** untuk menciptakan pengalaman bermain yang interaktif. **HomePage** menangani semua logika permainan, termasuk pergerakan, skor, dan kondisi menang/kalah.

Setiap bagian memiliki peran spesifik untuk memastikan permainan berjalan lancar, menarik, dan responsif! 🚀👾