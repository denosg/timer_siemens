import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_siemens/widgets/timer/preferred_timer.dart';

import '../providers/preferred_timer.dart';
import '../widgets/timer/choose_timer.dart';
import '../widgets/timer/new_pref_timer.dart';
import '../providers/timer_provider.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/timer/timer_button.dart';

class TimerScreen extends ConsumerStatefulWidget {
  static const routeName = 'timer-screen';
  const TimerScreen({super.key});

  @override
  TimerScreenState createState() => TimerScreenState();
}

class TimerScreenState extends ConsumerState<TimerScreen> {
  // initial show for time
  String _hours = '00';
  String _minutes = '30';
  String _seconds = '00';

  @override
  void initState() {
    super.initState();
    // Load the preferred timers when the timer screen is loaded
    ref.read(preferredTimerProvider.notifier).loadPreferredTimers();
  }

  @override
  Widget build(BuildContext context) {
    // gets the state from the timer_provider and preffered_timer with ref (Riverpod)
    final timerState = ref.watch(countdownProvider);
    final prefTimerState = ref.watch(preferredTimerProvider);

    final height = MediaQuery.of(context).size.height;

    final ColorScheme colors = Theme.of(context).colorScheme;

    // alert dialog for entering new item in the list
    Future<void> showDiagContext() async {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // title of dialog
            title: Text(
              'Add preset timer',
              style: TextStyle(
                fontSize: 20,
                color: colors.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            // NewTimer form
            content: NewTimer(
              onHoursChanged: (value) {
                setState(() {
                  _hours = value;
                });
              },
              onMinutesChanged: (value) {
                setState(() {
                  _minutes = value;
                });
              },
              onSecondsChanged: (value) {
                setState(() {
                  _seconds = value;
                });
              },
            ),
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
                onPressed: () {
                  Navigator.of(context).pop(false);
                  int hours = int.parse(_hours);
                  int minutes = int.parse(_minutes);
                  int seconds = int.parse(_seconds);
                  // adds the preferred timer here in the list
                  ref
                      .read(preferredTimerProvider.notifier)
                      .addPreferredTimer(hours, minutes, seconds);
                },
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
          // add a favorite preset + Download timers buttons
          PopupMenuButton(
            offset: const Offset(0, 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            itemBuilder: (context) => [
              // button for adding fav preset
              PopupMenuItem(
                value: 'addTimer',
                child: Text(
                  'Add a preset timer',
                  style: TextStyle(color: colors.secondary),
                ),
              ),
              // button for downloading pref timers
              PopupMenuItem(
                value: 'downloadTimers',
                child: Text(
                  'Download timers',
                  style: TextStyle(color: colors.secondary),
                ),
              ),
            ],
            onSelected: (value) async {
              // shows the dialog context for adding a preffered timer
              if (value == 'addTimer') {
                showDiagContext();
              }
              // downloads the timers to  preffered_timers.txt file in the apps folder
              if (value == 'downloadTimers') {
                ref
                    .read(preferredTimerProvider.notifier)
                    .downloadPreferredTimersToFile();
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
                    // if the timer didnt start, we have the choose timer wheel
                    ? const ChooseTimer()
                    // else we have the timer countdown
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
              // preview of preffered timers
              timerState.started
                  ? SizedBox(height: height * 0.15)
                  : SizedBox(
                      height: height * 0.15,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => PrefTimer(
                            index: index,
                            hours: prefTimerState[index].hours,
                            minutes: prefTimerState[index].minutes,
                            seconds: prefTimerState[index].seconds),
                        itemCount: prefTimerState.length,
                      ),
                    ),
              // buttons for timer
              const TimerButton(),
            ],
          ),
        ),
      ),
    );
  }
}
