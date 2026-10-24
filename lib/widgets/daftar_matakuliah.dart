import 'package:flutter/material.dart';

import '../screens/detail_mata_kuliah_screen.dart';
// Tambahan Langkah 2: Import widget LikeButton (sesuaikan path jika berada di folder lain, misal '../widgets/like_button.dart')
import 'like_button.dart';

class DaftarMataKuliah extends StatelessWidget {
  // 1. Menambahkan parameter untuk menerima data dari BerandaScreen
  final List<Map<String, String>> mataKuliahTambahan;

  // 2. Menambahkan parameter tersebut ke constructor dengan nilai default list kosong
  const DaftarMataKuliah({super.key, this.mataKuliahTambahan = const []});

  @override
  Widget build(BuildContext context) {
    // 3. Merombak daftar menggunakan Map agar sejenis dengan mataKuliahTambahan
    final daftar = [
      {
        'nama': 'Pemrograman Aplikasi Bergerak',
        'sks': '3',
        'dosen': 'Dr. Andi Saputra',
      },
      {'nama': 'Basis Data Lanjut', 'sks': '3', 'dosen': 'Dr. Rina Kartika'},
      {'nama': 'Jaringan Komputer', 'sks': '2', 'dosen': 'Budi Santoso, M.Kom'},
      // 4. Menggabungkan daftar tambahan ke list utama menggunakan spread operator (...)
      ...mataKuliahTambahan,
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: daftar.length,
      itemBuilder: (context, index) {
        final mk = daftar[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.menu_book, color: Colors.teal),
            // Mengakses data map
            title: Text(mk['nama'] ?? 'Tanpa Nama'),
            // Cek apakah ada dosen (karena dari form form tambah dosen tidak diinputkan)
            subtitle: Text(
              '${mk['sks']} SKS ${mk.containsKey('dosen') ? '- ${mk['dosen']}' : ''}',
            ),
            // Tambahan Langkah 2: Mengubah ikon chevron menjadi LikeButton
            trailing: const LikeButton(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMataKuliahScreen(
                    // Mengirimkan Map langsung ke halaman detail
                    mataKuliah: mk,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
