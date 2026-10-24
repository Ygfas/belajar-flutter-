import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/counter_model.dart';
import 'models/presensi_model.dart';

import 'widgets/kartu_info_kampus.dart';
import 'widgets/tombol_favorit.dart';
import 'widgets/kartu_profil.dart';
import 'widgets/header_dashboard.dart';
import 'widgets/menu_dashboard.dart';
import 'widgets/daftar_matakuliah.dart';
import 'widgets/stepper_counter.dart';
import 'screens/profil_screen.dart';
import 'screens/detail_mata_kuliah_screen.dart';
import 'screens/tambah_mata_kuliah_screen.dart';
import 'screens/main_navigation_screen.dart';
import 'screens/presensi_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterModel()),
        ChangeNotifierProvider(create: (context) => PresensiModel()),
      ],
      child: const MyApp(),
    ),
  );
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
        '/': (context) => const BerandaScreen(),
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
  int targetSksSemester = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar UI Flutter...'),
        actions: [
          Consumer<CounterModel>(
            builder: (context, counterModel, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: Text(
                    'Notifikasi: ${counterModel.counter}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profil');
            },
          ),
        ],
      ),
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
                leading: const Icon(Icons.qr_code_scanner),
                title: const Text('Presensi'),
                onTap: () {
                  Navigator.pop(drawerContext);
                  Navigator.push(
                    drawerContext,
                    MaterialPageRoute(
                      builder: (context) => const PresensiScreen(),
                    ),
                  );
                },
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
            const KartuProfil(),
            const SizedBox(height: 16),

            // Ringkasan Presensi (Dipindahkan ke atas Simulasi Notifikasi)
            Consumer<PresensiModel>(
              builder: (context, presensi, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ringkasan presensi hari ini: ${presensi.jumlahHadir} dari ${presensi.daftarMahasiswa.length} mahasiswa hadir',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // Simulasi Notifikasi Masuk (CounterModel Provider)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Simulasi Notifikasi Masuk:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Consumer<CounterModel>(
                    builder: (context, counterModel, child) {
                      return Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                            ),
                            onPressed: () {
                              if (counterModel.counter > 0) {
                                // Menurunkan counter jika ada metodenya
                              }
                            },
                            child: const Text('-'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Text(
                              '${counterModel.counter}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                            ),
                            onPressed: () {
                              counterModel.increment();
                            },
                            child: const Text('+'),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Target SKS Semester Ini
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Target SKS Semester Ini:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  StepperCounter(
                    nilai: targetSksSemester,
                    onChanged: (nilaiBaru) {
                      setState(() {
                        targetSksSemester = nilaiBaru;
                      });
                    },
                  ),
                ],
              ),
            ),
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
