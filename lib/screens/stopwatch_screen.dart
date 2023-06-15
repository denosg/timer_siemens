import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_siemens/widgets/custom_drawer.dart';
import 'package:timer_siemens/widgets/stopwatch/logic_button.dart';

import '../providers/stopwatch_provider.dart';
import '../widgets/stopwatch/lap_widget.dart';

class StopWatchScreen extends ConsumerWidget {
  static const routeName = 'stopwatch-screen';

  const StopWatchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stopwatchState = ref.watch(stopwatchProvider);

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.secondary),
      ),
      drawer: const CustomDrawer(),
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
                  '${stopwatchState.displayHour}:${stopwatchState.displayMin}:${stopwatchState.displaySec}',
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
                      LapWidget(time: stopwatchState.laps[index], index: index),
                  itemCount: stopwatchState.laps.length,
                ),
              ),
              // buttons area for using the timer ->
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // start button ->
                  LogicButton(
                    text: stopwatchState.started ? 'stop' : 'start',
                    callBackFunc: () {
                      if (stopwatchState.started) {
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
                    onPressed: !stopwatchState.started
                        ? null
                        : ref.read(stopwatchProvider.notifier).addLap,
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
