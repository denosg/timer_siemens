import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:timer_siemens/providers/timer_provider.dart';
import 'package:timer_siemens/widgets/timer/seconds_widget.dart';

import 'hours_widget.dart';
import 'minutes_widget.dart';

class ChooseTimer extends ConsumerStatefulWidget {
  const ChooseTimer({super.key});

  @override
  ChooseTimerState createState() => ChooseTimerState();
}

class ChooseTimerState extends ConsumerState<ChooseTimer> {
  late FixedExtentScrollController _secondsController;
  late FixedExtentScrollController _minutesController;
  late FixedExtentScrollController _hoursController;

  @override
  void initState() {
    super.initState();

    // initialize the controller with typical values
    _secondsController = FixedExtentScrollController(initialItem: 0);
    _minutesController = FixedExtentScrollController(initialItem: 30);
    _hoursController = FixedExtentScrollController(initialItem: 0);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final ColorScheme colors = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // row to SHOW TEXT hours / minutes / seconds
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // hours
              Text(
                'Hours',
                style: TextStyle(
                  fontSize: 20,
                  color: colors.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // minutes
              Text(
                'Minutes',
                style: TextStyle(
                  fontSize: 20,
                  color: colors.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // seconds
              Text(
                'Seconds',
                style: TextStyle(
                  fontSize: 20,
                  color: colors.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // row for hours / minutes / seconds
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // hours wheel
            SizedBox(
              height: height * 0.4,
              width: width * 0.2,
              child: ListWheelScrollView.useDelegate(
                controller: _hoursController,
                onSelectedItemChanged: (hours) =>
                    ref.read(countdownProvider.notifier).setHours(hours),
                itemExtent: 50,
                perspective: 0.008,
                diameterRatio: 1.2,
                overAndUnderCenterOpacity: 0.3,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 24,
                  builder: (context, index) {
                    return HoursWidget(hours: index);
                  },
                ),
              ),
            ),

            const SizedBox(
              width: 10,
            ),

            // minutes wheel
            SizedBox(
              height: height * 0.4,
              width: width * 0.2,
              child: ListWheelScrollView.useDelegate(
                onSelectedItemChanged: (minutes) =>
                    ref.read(countdownProvider.notifier).setMinutes(minutes),
                controller: _minutesController,
                itemExtent: 50,
                perspective: 0.008,
                diameterRatio: 1.2,
                overAndUnderCenterOpacity: 0.3,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 60,
                  builder: (context, index) {
                    return MinuntesWidget(minutes: index);
                  },
                ),
              ),
            ),

            const SizedBox(
              width: 15,
            ),

            //seconds wheel
            SizedBox(
              height: height * 0.4,
              width: width * 0.2,
              child: ListWheelScrollView.useDelegate(
                onSelectedItemChanged: (seconds) =>
                    ref.read(countdownProvider.notifier).setSeconds(seconds),
                controller: _secondsController,
                itemExtent: 50,
                perspective: 0.008,
                diameterRatio: 1.2,
                overAndUnderCenterOpacity: 0.3,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 60,
                  builder: (context, index) {
                    return SecondsWidget(seconds: index);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
