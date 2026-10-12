import 'package:flutter/material.dart';

class TambahMataKuliahScreen extends StatefulWidget {
  const TambahMataKuliahScreen({super.key});

  @override
  State<TambahMataKuliahScreen> createState() => _TambahMataKuliahScreenState();
}

class _TambahMataKuliahScreenState extends State<TambahMataKuliahScreen> {
  final _namaController = TextEditingController();
  final _sksController = TextEditingController();

  void _simpanDanKembali() {
    if (_namaController.text.isEmpty || _sksController.text.isEmpty) return;

    // Mengembalikan data ke halaman sebelumnya lewat Navigator.pop dengan nilai
    Navigator.pop(context, {
      'nama': _namaController.text,
      'sks': _sksController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Mata Kuliah')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama Mata Kuliah'),
            ),
            TextField(
              controller: _sksController,
              decoration: const InputDecoration(labelText: 'Jumlah SKS'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _simpanDanKembali,
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
