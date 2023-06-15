import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/timer/choose_timer.dart';
import '../widgets/timer/new_timer.dart';
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

    // alert dialog entering new item in the list
    Future<void> showDiagContext() async {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              'Add preset timer',
              style: TextStyle(
                fontSize: 20,
                color: colors.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const NewTimer(),
            // Options for the user regarding adding a timer
            actions: [
              TextButton(
                //closes the dialog if the user cancels
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 15,
                    color: colors.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                // add the preset timer in the db + state management
                onPressed: () {},
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 15,
                    color: colors.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.secondary),
        actions: [
          // add a favorite preset
          PopupMenuButton(
            offset: const Offset(0, 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'addTimer',
                child: Text('Add a preset timer'),
              ),
            ],
            onSelected: (value) async {
              if (value == 'addTimer') {
                showDiagContext();
              }
            },
          ),
        ],
      ),
      backgroundColor: colors.primary,
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.05),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colors.tertiary,
                ),
                height: height * 0.5,
                child: !timerState.started
                    ? const ChooseTimer()
                    : Center(
                        child: Text(
                          '${timerState.displayHour}:${timerState.displayMin}:${timerState.displaySec}',
                          style: TextStyle(
                            color: colors.secondary,
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
              ),
              SizedBox(height: height * 0.15),
              // buttons for timer
              const TimerButton(),
            ],
          ),
        ),
      ),
    );
  }
}
