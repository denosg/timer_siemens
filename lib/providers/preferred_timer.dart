import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreferredTimer {
  final int seconds;
  final int minutes;
  final int hours;
  final String displaySec;
  final String displayMin;
  final String displayHour;

  PreferredTimer({
    this.seconds = 0,
    this.minutes = 30,
    this.hours = 0,
    this.displaySec = '00',
    this.displayMin = '30',
    this.displayHour = '00',
  });

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
  PreferredTimerNotifier() : super([]);

  void addPreferredTimer(int hours, int minutes, int seconds) {
    final newTimer = PreferredTimer(
      seconds: seconds,
      minutes: minutes,
      hours: hours,
      displaySec: _getDisplayValue(seconds),
      displayMin: _getDisplayValue(minutes),
      displayHour: _getDisplayValue(hours),
    );
    state = [...state, newTimer];
  }

  String _getDisplayValue(int value) {
    return (value >= 10) ? "$value" : "0$value";
  }
}
