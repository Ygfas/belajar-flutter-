import 'package:flutter/material.dart';

import 'widgets/kartu_info_kampus.dart';
import 'widgets/tombol_favorit.dart';
import 'widgets/kartu_profil.dart';
import 'widgets/header_dashboard.dart';
import 'widgets/menu_dashboard.dart';
import 'widgets/daftar_matakuliah.dart';
import 'screens/profil_screen.dart';
import 'screens/detail_mata_kuliah_screen.dart';
import 'screens/tambah_mata_kuliah_screen.dart';
// Tambahkan import untuk MainNavigationScreen
import 'screens/main_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final skemaWarna = ColorScheme.fromSeed(seedColor: Colors.indigo);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: skemaWarna,
        appBarTheme: AppBarTheme(
          backgroundColor: skemaWarna.primary,
          foregroundColor: skemaWarna.onPrimary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: skemaWarna.primary,
            foregroundColor: skemaWarna.onPrimary,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        // =================================================================
        // OPSI 1: Tampilan BerandaScreen (Drawer Navigation - Praktikum 1-5)
        // Hapus tanda komentar (//) pada baris di bawah ini dan komentari OPSI 2
        // jika ingin melihat tampilan Beranda lama.
        // =================================================================
        // '/': (context) => const BerandaScreen(),

        // =================================================================
        // OPSI 2: Tampilan MainNavigationScreen (Bottom Navigation - Praktikum 6)
        // Aktifkan baris ini untuk menerapkan Praktikum 6 Langkah 3
        // =================================================================
        '/': (context) => const MainNavigationScreen(),

        '/profil': (context) => const ProfilScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final data = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) => DetailMataKuliahScreen(mataKuliah: data),
          );
        }
        return null;
      },
    );
  }
}

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  final List<Map<String, String>> mataKuliah = <Map<String, String>>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konsep Widget Flutter'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profil');
            },
          ),
        ],
      ),
      // Menambahkan Drawer sesuai Praktikum 5 Langkah 1
      drawer: Builder(
        builder: (drawerContext) => Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                child: Text(
                  'Menu Aplikasi',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Beranda'),
                onTap: () => Navigator.pop(drawerContext),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profil'),
                onTap: () {
                  Navigator.pop(drawerContext);
                  Navigator.pushNamed(drawerContext, '/profil');
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Keluar'),
                onTap: () => Navigator.pop(drawerContext),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderDashboard(),
            const SizedBox(height: 16),
            const MenuDashboard(),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal),
              ),
              child: const Text(
                'Halo, ini adalah sebuah Widget!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 16),
            const KartuInfoKampus(),
            const TombolFavorit(),
            const Divider(height: 32),
            const KartuProfil(),
            const SizedBox(height: 16),
            DaftarMataKuliah(mataKuliahTambahan: mataKuliah),
            const SizedBox(height: 24),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final hasil = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TambahMataKuliahScreen(),
            ),
          );

          if (hasil is Map<String, String>) {
            setState(() {
              mataKuliah.add(hasil);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
