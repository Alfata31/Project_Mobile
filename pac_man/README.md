### Deskripsi Fungsi dari Kode PACMAN Flutter

---

1. **MyBarrier**  
   Widget ini digunakan untuk membuat rintangan (barrier) di dalam permainan PACMAN. Rintangan memiliki dua lapisan warna, yaitu warna luar (outerColor) dan warna dalam (innerColor). Widget ini menggunakan efek sudut membulat untuk memberikan tampilan yang lebih halus. Tujuannya adalah untuk membatasi area pergerakan pemain dan hantu dalam permainan.

---

2. **Ghost**  
   Widget ini digunakan untuk menampilkan karakter hantu di dalam permainan. Gambar hantu diambil dari direktori aset lokal. Widget ini diberi padding agar tidak menempel langsung dengan tepi grid. Hantu ini berperan sebagai lawan yang harus dihindari oleh pemain.

---

3. **HomePage**  
   Halaman utama permainan yang menangani semua logika permainan PACMAN. Fungsinya meliputi:
   
   - **Pengaturan Pergerakan:** Mengontrol pergerakan pemain (PACMAN) ke kanan, kiri, atas, dan bawah.
   - **Pergerakan Hantu:** Mengontrol pergerakan otomatis dari karakter hantu dengan mempertimbangkan posisi pemain.
   - **Permulaan Permainan:** Memulai permainan dengan fungsi `startGame` dan menjalankan timer untuk mengatur jalannya permainan.
   - **Pengelolaan Skor:** Menghitung skor berdasarkan jumlah makanan yang dikumpulkan oleh pemain.
   - **Kondisi Permainan:** Menentukan kondisi menang (semua makanan dikumpulkan) atau kalah (bertemu dengan hantu).
   - **Dialog Permainan:** Menampilkan dialog ketika permainan selesai, baik dalam kondisi menang atau kalah.
   - **Reset Permainan:** Mengembalikan permainan ke kondisi awal setelah selesai atau ketika pemain ingin memulai ulang.

---

4. **MyPixel**  
   Widget ini digunakan untuk menampilkan elemen grid seperti titik makanan atau area kosong di dalam permainan. Seperti **MyBarrier**, elemen ini juga memiliki dua lapisan warna: warna dalam dan warna luar. Elemen ini membantu membentuk jalur permainan dan memberikan tampilan visual pada area permainan.

---

5. **main**  
   Fungsi utama yang menjalankan aplikasi Flutter. Widget **MyApp** merender halaman utama permainan, yaitu **HomePage**. Pengaturan ini memastikan bahwa aplikasi memulai dari halaman permainan PACMAN dengan antarmuka berbasis **Material Design**.

---

6. **PacmanDude**  
   Widget ini digunakan untuk menampilkan karakter pemain PACMAN. Gambar PACMAN diambil dari direktori aset lokal dan diberi warna kuning. Widget ini memiliki padding untuk memastikan tampilannya rapi di dalam grid. Karakter PACMAN dapat berputar sesuai arah pergerakan pemain (kanan, kiri, atas, atau bawah).

---

### Ringkasan  
Proyek ini merupakan permainan PACMAN sederhana yang dibuat dengan Flutter. Terdapat elemen-elemen utama seperti rintangan, pemain, hantu, makanan, dan halaman utama yang menangani logika permainan. Setiap komponen bekerja sama untuk menciptakan pengalaman bermain yang interaktif dan menarik.