import 'package:flutter/material.dart';

class SecondsWidget extends StatelessWidget {
  final int seconds;

  const SecondsWidget({super.key, required this.seconds});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
        child: Text(
          seconds < 10 ? '0$seconds' : seconds.toString(),
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
