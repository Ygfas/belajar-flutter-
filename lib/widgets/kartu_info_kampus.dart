import 'package:flutter/material.dart';

class KartuInfoKampus extends StatelessWidget {
  const KartuInfoKampus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.blueGrey.shade50,
      child: const Text('Universitas Contoh - Semester Ganjil 2026/2027'),
    );
  }
}
