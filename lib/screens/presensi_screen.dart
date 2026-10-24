import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/presensi_model.dart';

class PresensiScreen extends StatelessWidget {
  const PresensiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PresensiModel>(
      builder: (context, presensi, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Presensi (${presensi.jumlahHadir}/${presensi.daftarMahasiswa.length} hadir)',
            ),
          ),
          body: ListView.builder(
            itemCount: presensi.daftarMahasiswa.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(presensi.daftarMahasiswa[index]),
                value: presensi.statusPada(index),
                onChanged: (bool? value) => presensi.toggleHadir(index),
              );
            },
          ),
        );
      },
    );
  }
}
