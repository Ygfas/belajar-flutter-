import 'package:flutter/material.dart';

class StepperCounter extends StatelessWidget {
  final int nilai;
  final ValueChanged<int> onChanged;

  const StepperCounter({
    super.key,
    required this.nilai,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () => onChanged(nilai - 1),
        ),
        Text('$nilai', style: const TextStyle(fontSize: 18)),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: () => onChanged(nilai + 1),
        ),
      ],
    );
  }
}