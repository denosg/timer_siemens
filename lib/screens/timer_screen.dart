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
  TimerScreenState createState() => TimerScreenState();
}

class TimerScreenState extends ConsumerState<TimerScreen> {
  late FixedExtentScrollController _secondsController;
  late FixedExtentScrollController _minutesController;
  late FixedExtentScrollController _hoursController;

  @override
  void initState() {
    super.initState();

    _secondsController = FixedExtentScrollController(initialItem: 0);
    _minutesController = FixedExtentScrollController(initialItem: 30);
    _hoursController = FixedExtentScrollController(initialItem: 0);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.secondary),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colors.tertiary,
            ),
            height: height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // row to SHOW TEXT hours / minutes / seconds
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Hours',
                        style: TextStyle(
                          fontSize: 20,
                          color: colors.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Minutes',
                        style: TextStyle(
                          fontSize: 20,
                          color: colors.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
            ),
          ),
        ),
      ),
    );
  }
}
