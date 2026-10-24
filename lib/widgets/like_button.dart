import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool disukai = false;

  @override
  void initState() {
    super.initState();
    // dijalankan satu kali saat widget pertama kali dibuat
    debugPrint('LikeButton dibuat dengan state awal: disukai = $disukai');
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        disukai ? Icons.favorite : Icons.favorite_border,
        color: disukai ? Colors.red : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          disukai = !disukai;
        });
      },
    );
  }
}
