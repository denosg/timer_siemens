import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_siemens/widgets/timer/minutes_widget.dart';
import 'package:timer_siemens/widgets/timer/seconds_widget.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/timer/hours_widget.dart';

class TimerScreen extends ConsumerStatefulWidget {
  static const routeName = 'timer-screen';
  const TimerScreen({super.key});

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends ConsumerState<TimerScreen> {
  late FixedExtentScrollController _secondsController;
  late FixedExtentScrollController _minutesController;
  late FixedExtentScrollController _hoursController;

  @override
  void initState() {
    super.initState();

    _secondsController = FixedExtentScrollController();
    _minutesController = FixedExtentScrollController();
    _hoursController = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.secondary),
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Row(
          children: [
            // hours wheel
            Container(
              width: width * 0.2,
              child: ListWheelScrollView.useDelegate(
                controller: _hoursController,
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.2,
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
            Container(
              width: width * 0.2,
              child: ListWheelScrollView.useDelegate(
                controller: _minutesController,
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.2,
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
            Container(
              width: width * 0.2,
              child: ListWheelScrollView.useDelegate(
                controller: _secondsController,
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.2,
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
      ),
    );
  }
}
