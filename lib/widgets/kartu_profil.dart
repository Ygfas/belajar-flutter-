import 'package:flutter/material.dart';

class KartuProfil extends StatelessWidget {
  const KartuProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 36,
            backgroundColor: Colors.teal,
            child: Icon(Icons.person, size: 36, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Text(
            'Sari Wulandari',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            'NIM: 2210001 - Informatika',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(Icons.email, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text('sari@contoh.ac.id', style: TextStyle(fontSize: 13)),
            ],
          ),
          const SizedBox(height: 16),
         Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Edit Profil'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Lihat KHS'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
