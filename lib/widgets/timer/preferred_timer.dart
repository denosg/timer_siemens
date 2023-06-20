import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_siemens/providers/preferred_timer.dart';
import 'package:timer_siemens/providers/timer_provider.dart';

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
    final ColorScheme colors = Theme.of(context).colorScheme;

    String getDisplayValue(int value) {
      return (value >= 10) ? "$value" : "0$value";
    }

    void showAlertDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: colors.tertiary,
            elevation: 20,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text('Are you sure ?',
                style: TextStyle(
                  color: colors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            content: Text('Do you want to remove your timer ?',
                style: TextStyle(color: colors.secondary)),
            // Options for the user regarding deleting a timer
            actions: [
              // NO -> closes the alert dialog
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No', style: TextStyle(color: colors.secondary)),
              ),
              // YES -> closes the alert dialog + deletes the pref timer from db + local memory
              TextButton(
                onPressed: () {
                  ref
                      .read(preferredTimerProvider.notifier)
                      .deletePrefferedTimerByIndex(index);
                  Navigator.of(context).pop();
                },
                child: Text('Yes', style: TextStyle(color: colors.secondary)),
              )
            ],
          );
        },
      );
    }

    void startPresetTimer(int seconds, int minutes, int hours) {
      // sets the timer parameters
      ref.read(countdownProvider.notifier).setSeconds(seconds);
      ref.read(countdownProvider.notifier).setMinutes(minutes);
      ref.read(countdownProvider.notifier).setHours(hours);
      // starts the timer
      ref.read(countdownProvider.notifier).startCountdown();
    }

    return InkWell(
      // long pressing on the item deletes the preffered timer
      onLongPress: showAlertDialog,
      // onTap starts the preset timer chosen on the screen TODO: implement here ->
      onTap: () => startPresetTimer(seconds, minutes, hours),
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
                getDisplayValue(hours),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colors.secondary,
                ),
              ),
              const Text(":"),
              //minutes
              Text(
                getDisplayValue(minutes),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colors.secondary,
                ),
              ),
              const Text(":"),
              //seconds
              Text(
                getDisplayValue(seconds),
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
