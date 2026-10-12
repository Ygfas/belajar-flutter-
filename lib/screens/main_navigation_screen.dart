import 'package:flutter/material.dart';

import 'mata_kuliah_tab_screen.dart';
import 'profil_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _indexAktif = 0;

  final List<Widget> _halaman = const [
    Center(child: Text('Halaman Beranda (ringkasan singkat)')),
    MataKuliahTabScreen(),
    ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aplikasi Akademik')),
      body: _halaman[_indexAktif],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexAktif,
        selectedItemColor: Colors.teal,
        onTap: (index) {
          setState(() {
            _indexAktif = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Mata Kuliah'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
