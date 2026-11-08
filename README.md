# UTS Lab Pemrograman Mobile

**Nama:** Leonard Auguste  
**NIM:** 241401078  
**Lab:** PM 5

## Deskripsi Aplikasi

**Kwis App** merupakan aplikasi mobile interaktif berbasis Flutter yang dirancang untuk menguji wawasan pengguna melalui kuis pilihan ganda.

Aplikasi ini memungkinkan pengguna melakukan personalisasi dengan memasukkan nama dan memilih kategori kuis, yaitu Pengetahuan Umum, Matematika, dan Pemrograman.

Dibangun dengan antarmuka yang sederhana, modern, dan responsif, aplikasi ini menggunakan font kustom **Geist** untuk memberikan pengalaman pengguna yang lebih nyaman.

Selain fitur utama kuis, aplikasi ini juga dilengkapi dengan fitur tambahan berupa animasi Confetti sebagai perayaan ketika pengguna memperoleh akurasi di atas 80%, serta Local Leaderboard yang menggunakan SharedPreferences untuk menyimpan riwayat skor secara lokal tanpa memerlukan database eksternal.

## Fitur Aplikasi

1. **Personalisasi Pengguna**  
   Pengguna memasukkan nama sebelum memulai kuis agar pengalaman penggunaan lebih personal.

2. **State Management**  
   Menggunakan StatefulWidget untuk mengelola progres kuis, pilihan jawaban, dan perhitungan skor selama permainan berlangsung.

3. **Kalkulasi Statistik Hasil**  
   Menampilkan skor akhir, persentase akurasi, serta rincian jumlah jawaban benar dan salah.

4. **Pemilihan Kategori Kuis**  
   Tersedia tiga kategori kuis: Pengetahuan Umum, Matematika, dan Pemrograman.

5. **Local Leaderboard**  
   Menggunakan SharedPreferences untuk menyimpan riwayat nama pengguna, kategori kuis, dan skor secara lokal pada perangkat.

6. **Confetti Animation**  
   Memberikan animasi perayaan ketika pengguna berhasil memperoleh akurasi sebesar 80% atau lebih.

## Tools

| Komponen | Teknologi |
|---|---|
| Framework | Flutter |
| Programming Language | Dart |
| State Management | StatefulWidget |
| Local Storage | SharedPreferences |
| Animation | Confetti |
| Custom Font | Geist |
| UI/UX Design | Figma |

### Assets

- **Logo Kwis App**
  <img src="https://github.com/user-attachments/assets/e0c99364-c5cf-4f66-b661-40d79d1dd83c" width="100" alt="Quiz App Logo" />

- **Font:** Geist

## Screenshots Aplikasi

<table>
  <tr>
    <td align="center">
      <strong>Homepage</strong><br/>
      <img src="https://github.com/user-attachments/assets/967c72d8-379d-4a3e-ba53-728d2f454315" width="220" alt="Homepage"/>
    </td>
    <td align="center">
      <strong>Leaderboard</strong><br/>
      <img src="https://github.com/user-attachments/assets/053cc66f-04fb-4a0f-86cf-6a1c2734e452" width="220" alt="Leaderboard"/>
    </td>
  </tr>
  <tr>
    <td align="center">
      <strong>Quiz Page</strong><br/> 
      <img src="https://github.com/user-attachments/assets/63c5c159-ec52-4f9b-a91a-dc882e5f5583" width="220" alt="Quiz Page"/>
    </td>
    <td align="center">
      <strong>Result Page</strong><br/> 
      <img src="https://github.com/user-attachments/assets/2b2b1a54-94a2-40ab-a3c3-24cb033b4cbf" width="220" alt="Result Page"/>
    </td>
  </tr>
</table>

## UI/UX Prototype

Desain dan prototype aplikasi dibuat menggunakan Figma.

🔗 [View Figma Prototype](https://www.figma.com/design/sEVPSSxSyh0MR0WKm6eQMJ/Quizzly---Mobile-Quiz-App-UI?node-id=5-275&t=8SBUVtFJzYZL81QN-1)

## Video Presentasi

[Link Video Presentasi](https://youtu.be/DpkumGOftEo)

