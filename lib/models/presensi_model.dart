import 'package:flutter/foundation.dart';

class PresensiModel extends ChangeNotifier {
  final List<String> daftarMahasiswa = ['Andi', 'Budi', 'Citra', 'Dedi'];
  late List<bool> _statusHadir;

  PresensiModel() {
    _statusHadir = List.filled(daftarMahasiswa.length, false);
  }

  bool statusPada(int index) => _statusHadir[index];
  int get jumlahHadir => _statusHadir.where((hadir) => hadir).length;

  void toggleHadir(int index) {
    _statusHadir[index] = !_statusHadir[index];
    notifyListeners();
  }
}