import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerScreen extends ConsumerWidget {
  static const routeName = "timer-screen";

  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late FixedExtentScrollController _secondsController;
    late FixedExtentScrollController _minutesController;
    late FixedExtentScrollController _hoursController;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // hours wheel
          Container(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              controller: _hoursController,
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 13,
                builder: (context, index) {
                  return HoursWidget(
                    hours: index,
                  );
                },
              ),
            ),
          ),

          SizedBox(
            width: 10,
          ),

          // minutes wheel
          Container(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 60,
                builder: (context, index) {
                  return MyMinutes(
                    mins: index,
                  );
                },
              ),
            ),
          ),

          SizedBox(
            width: 15,
          ),

          // am or pm
          Container(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 2,
                builder: (context, index) {
                  if (index == 0) {
                    return AmPm(
                      isItAm: true,
                    );
                  } else {
                    return AmPm(
                      isItAm: false,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
