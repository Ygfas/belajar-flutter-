import 'package:flutter/material.dart';

class MataKuliahTabScreen extends StatelessWidget {
  const MataKuliahTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.teal,
            tabs: [
              Tab(text: 'Semester Ini'),
              Tab(text: 'Riwayat'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Konten untuk Tab 'Semester Ini'
                const Center(
                  child: Text(
                    'Daftar mata kuliah semester ini akan tampil di sini.',
                  ),
                ),

                // Konten untuk Tab 'Riwayat'
                const Center(
                  child: Text('Riwayat mata kuliah yang sudah diambil.'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
