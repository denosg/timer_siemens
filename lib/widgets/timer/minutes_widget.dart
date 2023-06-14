import 'package:flutter/material.dart';

class MinuntesWidget extends StatelessWidget {
  const MinuntesWidget({super.key, required this.minutes});

  final int minutes;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
        child: Text(
          minutes < 10 ? '0$minutes' : minutes.toString(),
          style: TextStyle(
            fontSize: 40,
            color: colors.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
