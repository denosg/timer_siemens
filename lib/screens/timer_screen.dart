import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_siemens/widgets/timer/choose_timer.dart';

import '../providers/timer_provider.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/timer/timer_button.dart';

class TimerScreen extends ConsumerWidget {
  static const routeName = 'timer-screen';
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(countdownProvider);

    final height = MediaQuery.of(context).size.height;

    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.secondary),
      ),
      backgroundColor: colors.primary,
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors.tertiary,
              ),
              height: height * 0.5,
              child: const ChooseTimer(),
            ),
            // buttons for timer
            const TimerButton(),
          ],
        ),
      ),
    );
  }
}
