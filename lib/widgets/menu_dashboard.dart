import 'package:flutter/material.dart';

class MenuDashboard extends StatelessWidget {
  const MenuDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil lebar layar perangkat
    final lebarLayar = MediaQuery.of(context).size.width;
    // Di layar sempit (HP) tampilkan 4 kolom, di layar lebar (tablet) tampilkan 6 kolom
    final jumlahKolom = lebarLayar > 600 ? 6 : 4;

    final menu = [
      {'label': 'Nilai', 'icon': Icons.assignment},
      {'label': 'Presensi', 'icon': Icons.check_circle},
      {'label': 'Jadwal', 'icon': Icons.calendar_today},
      {'label': 'KRS', 'icon': Icons.edit_note},
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: jumlahKolom, // Menggunakan variabel jumlahKolom
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: menu.map((item) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal.shade50,
              child: Icon(item['icon'] as IconData, color: Colors.teal),
            ),
            const SizedBox(height: 4),
            Text(item['label'] as String, style: const TextStyle(fontSize: 11)),
          ],
        );
      }).toList(),
    );
  }
}
