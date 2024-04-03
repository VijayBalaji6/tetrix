import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  const Block({super.key, required this.blockColor, required this.number});
  final Color blockColor;
  final int number;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: blockColor, borderRadius: BorderRadius.circular(4)),
      child: Center(
          child: Text(
        number.toString(),
        style: const TextStyle(color: Colors.white),
      )),
    );
  }
}
