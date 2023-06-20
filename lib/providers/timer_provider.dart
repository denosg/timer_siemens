import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final countdownProvider =
    StateNotifierProvider<CountdownNotifier, CountdownState>(
        (ref) => CountdownNotifier());

class CountdownNotifier extends StateNotifier<CountdownState> {
  CountdownNotifier() : super(CountdownState());
  Timer? _timer;

  // set the seconds for the coundtown
  void setSeconds(int seconds) {
    String showSec = (seconds >= 10) ? "$seconds" : "0$seconds";
    state = state.copyWith(seconds: seconds, displaySec: showSec);
  }

  // set the minutes for the coundtown
  void setMinutes(int minutes) {
    String showMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
    state = state.copyWith(minutes: minutes, displayMin: showMinutes);
  }

  // set the hours for the coundtown
  void setHours(int hours) {
    String showHours = (hours >= 10) ? "$hours" : "0$hours";
    state = state.copyWith(hours: hours, displayHour: showHours);
  }

  // start countdown function ->
  void startCountdown() {
    if (state.started) return;

    state = state.copyWith(started: true, showDiffButt: true);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      int localSeconds = state.seconds;
      int localMinutes = state.minutes;
      int localHour = state.hours;
      // add all seconds to see how much total seconds we have
      int totalSeconds = localSeconds + localMinutes * 60 + localHour * 3600;
      // we substract here 1 second for the countdown
      totalSeconds--;
      // verifies if we have reached the end
      if (totalSeconds == 0) {
        //if we reach the end, we start with the 30 min again if the user just presses it again (bug fix)
        state = state.copyWith(
            started: false,
            showDiffButt: false,
            minutes: 30,
            displayMin: '30',
            seconds: 0,
            displaySec: '00');
        _timer!.cancel();
        return;
      }

      //attribute the hours, minutes and remaining seconds from the total seconds
      localHour = totalSeconds ~/ 3600; // efective integer definition
      int remainingSeconds = totalSeconds % 3600;
      localMinutes = (remainingSeconds ~/ 60);
      localSeconds = remainingSeconds % 60;

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

  // stop countdown function ->
  void stopCountdown() {
    _timer?.cancel();
    state = state.copyWith(started: false, showDiffButt: true);
  }

  // reset countdown function ->
  void resetCountdown() {
    _timer?.cancel();
    state = CountdownState();
  }
}

class CountdownState {
  final int seconds;
  final int minutes;
  final int hours;
  final String displaySec;
  final String displayMin;
  final String displayHour;
  final bool started;
  final bool showDiffButt;

  CountdownState({
    this.seconds = 0,
    this.minutes = 30,
    this.hours = 0,
    this.displaySec = '00',
    this.displayMin = '30',
    this.displayHour = '00',
    this.started = false,
    this.showDiffButt = false,
  });

  CountdownState copyWith({
    int? seconds,
    int? minutes,
    int? hours,
    String? displaySec,
    String? displayMin,
    String? displayHour,
    bool? started,
    bool? showDiffButt,
    List<String>? laps,
  }) {
    return CountdownState(
      seconds: seconds ?? this.seconds,
      minutes: minutes ?? this.minutes,
      hours: hours ?? this.hours,
      displaySec: displaySec ?? this.displaySec,
      displayMin: displayMin ?? this.displayMin,
      displayHour: displayHour ?? this.displayHour,
      started: started ?? this.started,
      showDiffButt: showDiffButt ?? this.showDiffButt,
    );
  }
}
