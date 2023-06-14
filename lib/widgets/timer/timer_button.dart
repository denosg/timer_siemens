import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/timer_provider.dart';

class TimerButton extends ConsumerWidget {
  const TimerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(countdownProvider);

    final ColorScheme colors = Theme.of(context).colorScheme;

    final double width = MediaQuery.of(context).size.width;
    return timerState.started
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // stop timer button
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colors.tertiary),
                child: IconButton(
                  // stop timer metod
                  onPressed: () {
                    ref.read(countdownProvider.notifier).resetCountdown();
                  },
                  icon: const Icon(Icons.stop, size: 32),
                ),
              ),
              SizedBox(width: width * 0.15),
              // pause timer button
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colors.tertiary, // Set the desired background color
                ),
                child: IconButton(
                  // pause timer metod
                  onPressed: () {
                    ref.read(countdownProvider.notifier).stopCountdown();
                  },
                  icon: const Icon(Icons.pause, size: 32),
                ),
              ),
            ],
          )
        // start timer button
        : Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colors.tertiary, // Set the desired background color
            ),
            child: IconButton(
              // start timer metod
              onPressed: () {
                ref.read(countdownProvider.notifier).startCountdown();
              },
              icon: const Icon(Icons.play_circle_filled, size: 32),
            ),
          );
  }
}
