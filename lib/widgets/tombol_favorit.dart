import 'package:flutter/material.dart';

class TombolFavorit extends StatefulWidget {
  const TombolFavorit({super.key});

  @override
  State<TombolFavorit> createState() => _TombolFavoritState();
}

class _TombolFavoritState extends State<TombolFavorit> {
  bool _sudahFavorit = false;

  void _toggleFavorit() {
    setState(() {
      _sudahFavorit = !_sudahFavorit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _toggleFavorit,
      icon: Icon(
        _sudahFavorit ? Icons.favorite : Icons.favorite_border,
        color: _sudahFavorit ? Colors.red : Colors.grey,
      ),
    );
  }
}
