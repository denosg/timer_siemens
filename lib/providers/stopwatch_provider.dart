import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final stopwatchProvider =
    StateNotifierProvider<StopWatchNotifier, StopWatchState>((ref) {
  return StopWatchNotifier();
});

class StopWatchNotifier extends StateNotifier<StopWatchState> {
  Timer? _timer;

  StopWatchNotifier() : super(StopWatchState());

  // start timer function ->
  void startTimer() {
    if (state.started) return;

    state = state.copyWith(started: true);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      int localSeconds = state.seconds + 1;
      int localMinutes = state.minutes;
      int localHour = state.hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHour++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      String showSec =
          (localSeconds >= 10) ? "$localSeconds" : "0$localSeconds";
      String showMin =
          (localMinutes >= 10) ? "$localMinutes" : "0$localMinutes";
      String showHour = (localHour >= 10) ? "$localHour" : "0$localHour";

      state = state.copyWith(
        seconds: localSeconds,
        minutes: localMinutes,
        hours: localHour,
        displayHour: showHour,
        displayMin: showMin,
        displaySec: showSec,
      );
    });
  }

  // stop timer function ->
  void stopTimer() {
    _timer?.cancel();
    state = state.copyWith(started: false);
  }

  // reset timer function ->
  void resetTimer() {
    _timer?.cancel();
    state = StopWatchState();
  }

  // lap function ->
  void addLap() {
    String lap = "${state.displayHour}:${state.displayMin}:${state.displaySec}";
    state = state.copyWith(laps: [...state.laps, lap]);
  }
}

class StopWatchState {
  final int seconds;
  final int minutes;
  final int hours;
  final String displaySec;
  final String displayMin;
  final String displayHour;
  final bool started;
  final List<String> laps;

  StopWatchState({
    this.seconds = 0,
    this.minutes = 0,
    this.hours = 0,
    this.displaySec = '00',
    this.displayMin = '00',
    this.displayHour = '00',
    this.started = false,
    this.laps = const [],
  });

  StopWatchState copyWith({
    int? seconds,
    int? minutes,
    int? hours,
    String? displaySec,
    String? displayMin,
    String? displayHour,
    bool? started,
    List<String>? laps,
  }) {
    return StopWatchState(
      seconds: seconds ?? this.seconds,
      minutes: minutes ?? this.minutes,
      hours: hours ?? this.hours,
      displaySec: displaySec ?? this.displaySec,
      displayMin: displayMin ?? this.displayMin,
      displayHour: displayHour ?? this.displayHour,
      started: started ?? this.started,
      laps: laps ?? this.laps,
    );
  }
}
