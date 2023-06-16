import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_siemens/providers/preferred_timer.dart';

class PrefTimer extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final prefferedTimerState = ref.watch(preferredTimerProvider);

    final ColorScheme colors = Theme.of(context).colorScheme;

    String _getDisplayValue(int value) {
      return (value >= 10) ? "$value" : "0$value";
    }

    return InkWell(
      // long pressing on the item deletes the preffered timer
      // TODO: create alert dialog for it do display
      onLongPress: () => ref
          .read(preferredTimerProvider.notifier)
          .deletePrefferedTimerByIndex(index),
      child: Padding(
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
      ),
    );
  }
}
