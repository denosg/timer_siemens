import 'package:flutter/material.dart';

class PrefTimer extends StatelessWidget {
  final int index;
  final int hours;
  final int minutes;
  final int seconds;

  const PrefTimer(
      {super.key,
      required this.index,
      required this.hours,
      required this.minutes,
      required this.seconds});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    String _getDisplayValue(int value) {
      return (value >= 10) ? "$value" : "0$value";
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: colors.primary,
          shape: BoxShape.circle,
          border: Border.all(
            color: colors.secondary,
            width: 1.2,
          ),
        ),
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            // hours
            Text(
              _getDisplayValue(hours),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: colors.secondary,
              ),
            ),
            //separator
            const Text(":"),
            Text(
              _getDisplayValue(minutes),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: colors.secondary,
              ),
            ),
            //separator
            const Text(":"),
            Text(
              _getDisplayValue(seconds),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: colors.secondary,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
