import 'package:flutter/material.dart';

class HoursWidget extends StatelessWidget {
  final int hours;
  const HoursWidget({super.key, required this.hours});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
        child: Text(
          hours < 10 ? '0$hours' : hours.toString(),
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
