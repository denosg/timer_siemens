import 'package:flutter/material.dart';

class LapWidget extends StatelessWidget {
  final String time;
  final int index;
  const LapWidget({super.key, required this.time, required this.index});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Lap: ${index + 1}: ',
                style: TextStyle(
                  color: colors.secondary,
                  fontSize: 16.0,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  color: colors.secondary,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Divider(thickness: 2, color: colors.secondary),
        ),
      ],
    );
  }
}
