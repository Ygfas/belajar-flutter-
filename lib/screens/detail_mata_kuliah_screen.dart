import 'package:flutter/material.dart';

class DetailMataKuliahScreen extends StatelessWidget {
  final Map<String, String> mataKuliah;

  const DetailMataKuliahScreen({super.key, required this.mataKuliah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mataKuliah['nama']!)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah SKS: ${mataKuliah['sks']}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Deskripsi lengkap mata kuliah akan ditambahkan pada pengembangan berikutnya.',
            ),
          ],
        ),
      ),
    );
  }
}
