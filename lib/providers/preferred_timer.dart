import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:open_file/open_file.dart';

import '../helper/db_helper.dart';

final preferredTimerProvider =
    StateNotifierProvider<PreferredTimerNotifier, List<PreferredTimer>>(
        (ref) => PreferredTimerNotifier());

// create the preferred timer blueprint class
class PreferredTimer {
  final int seconds;
  final int minutes;
  final int hours;
  final String displaySec;
  final String displayMin;
  final String displayHour;

  //pre-made choices for when the newTimer pops
  PreferredTimer({
    this.seconds = 0,
    this.minutes = 30,
    this.hours = 0,
    this.displaySec = '00',
    this.displayMin = '30',
    this.displayHour = '00',
  });

  // copyWith method for saving the data
  PreferredTimer copyWith({
    int? seconds,
    int? minutes,
    int? hours,
    String? displaySec,
    String? displayMin,
    String? displayHour,
  }) {
    return PreferredTimer(
      seconds: seconds ?? this.seconds,
      minutes: minutes ?? this.minutes,
      hours: hours ?? this.hours,
      displaySec: displaySec ?? this.displaySec,
      displayMin: displayMin ?? this.displayMin,
      displayHour: displayHour ?? this.displayHour,
    );
  }
}

class PreferredTimerNotifier extends StateNotifier<List<PreferredTimer>> {
  PreferredTimerNotifier() : super([]) {
    // load the preferredtimers from phone memory (if there are any)
    loadPreferredTimers();
  }

  // saves the timer in a file (the task from Cristoph)
  void downloadPreferredTimersToFile() async {
    const String fileName = 'preferred_timers.txt';
    final appDocumentsDirectory = await path.getApplicationDocumentsDirectory();
    final filePath = '${appDocumentsDirectory.path}/$fileName';
    final file = File(filePath);

    final buffer = StringBuffer();
    for (final timer in state) {
      buffer.writeln(
          'Hours: ${timer.hours}, Minutes: ${timer.minutes}, Seconds: ${timer.seconds}');
    }

    // Save the file in the app's private storage
    try {
      await file.writeAsString(buffer.toString());
      print('File saved successfully!');
      print('File path: ${file.path}');
    } catch (e) {
      print('Error saving file: $e');
      return;
    }

    // Use SAF to prompt the user to choose a location to save the file
    final downloadsDirectory = await path.getExternalStorageDirectory();
    final savedFile = await file.copy('${downloadsDirectory!.path}/$fileName');

    // Open the saved file using a file viewer app
    OpenFile.open(savedFile.path);
  }

  // deletes the timer by index and updates the state of the list
  void deletePrefferedTimerByIndex(int index) async {
    // deletes the timer also from memory
    await DatabaseHelper.instance.deletePreferredTimerByIndex(index);
    //updates the ui
    state = [...state]..removeAt(index);
  }

  // method for loading the preferredtimers
  Future<void> loadPreferredTimers() async {
    final timers = await DatabaseHelper.instance.getPreferredTimers();
    // updating the state of the timers in the local memory
    state = timers;
  }

  // addPreferredTimer method for saving a prefferd timer from the timer form screen
  void addPreferredTimer(int hours, int minutes, int seconds) async {
    final newTimer = PreferredTimer(
      seconds: seconds,
      minutes: minutes,
      hours: hours,
      displaySec: _getDisplayValue(seconds),
      displayMin: _getDisplayValue(minutes),
      displayHour: _getDisplayValue(hours),
    );

    // adding a preferred timer in the phone memory aswell (not local, but for keeping it stored for the next session)
    await DatabaseHelper.instance.addPreferredTimer(newTimer);

    // update the state of the timers to add a timer in the list
    state = [...state, newTimer];
  }

  // the display value of the timer for showcasing in the UI
  String _getDisplayValue(int value) {
    return (value >= 10) ? "$value" : "0$value";
  }
}
