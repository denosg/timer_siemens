import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_siemens/widgets/lap_widget.dart';
import 'package:timer_siemens/widgets/logic_button.dart';

import '../providers/stopwatch_provider.dart';

class StopWatchScreen extends ConsumerWidget {
  const StopWatchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(stopwatchProvider);

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Center Title of app
              Center(
                child: Text(
                  "Stopwatch",
                  style: TextStyle(
                    color: colors.secondary,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              // Stopwatch seconds
              Center(
                child: Text(
                  '${timerState.displayHour}:${timerState.displayMin}:${timerState.displaySec}',
                  style: TextStyle(
                    color: colors.secondary,
                    fontSize: 80,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                // half the size of the screen
                height: height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colors.tertiary,
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      LapWidget(time: timerState.laps[index], index: index),
                  itemCount: timerState.laps.length,
                ),
              ),
              // buttons area for using the timer ->
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // start button ->
                  LogicButton(
                    text: timerState.started ? 'stop' : 'start',
                    callBackFunc: () {
                      if (timerState.started) {
                        ref.read(stopwatchProvider.notifier).stopTimer();
                      } else {
                        ref.read(stopwatchProvider.notifier).startTimer();
                      }
                    },
                  ),
                  // lap button ->
                  SizedBox(width: width * 0.02),
                  IconButton(
                    // reads the stopwatchProvider method for adding the lap in the list ->
                    onPressed: ref.read(stopwatchProvider.notifier).addLap,
                    color: colors.secondary,
                    icon: const Icon(Icons.flag),
                  ),
                  SizedBox(width: width * 0.02),
                  // reset button ->
                  LogicButton(
                    text: "reset",
                    // reads the stopwatchProvider method for resetting the stopwatch ->
                    callBackFunc:
                        ref.read(stopwatchProvider.notifier).resetTimer,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
