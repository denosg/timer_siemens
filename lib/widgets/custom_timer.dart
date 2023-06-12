import 'dart:async';

import 'package:flutter/material.dart';

class CustomTimer extends StatefulWidget {
  const CustomTimer({super.key});

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  int seconds = 0, minutes = 0, hours = 0;
  String displaySec = "00", displayMin = "00", displayHour = "00";
  Timer? timer;
  bool started = false;
  List<String> laps = [];

  // stop timer function ->
  void stopTimer() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  // reset timer function ->
  void resetTimer() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      displaySec = "00";
      displayMin = "00";
      displayHour = "00";

      started = false;
    });
  }

  // lap function ->
  void addLap() {
    String lap = "$displayHour:$displayMin:$displaySec";
    setState(() {
      laps.add(lap);
    });
  }

  // start timer function ->
  void startTimer() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int loadSeconds = seconds + 1;
      int loadMinutes = minutes;
      int loadHours = hours;

      if (loadSeconds > 59) {
        if (loadMinutes > 59) {
          loadHours++;
          loadMinutes = 0;
        } else {
          loadMinutes++;
          loadSeconds = 0;
        }
      }
      setState(() {
        seconds = loadSeconds;
        minutes = loadMinutes;
        hours = loadHours;

        displaySec = (seconds >= 10) ? "$seconds" : "0$seconds";
        displayMin = (minutes >= 10) ? "$minutes" : "0$minutes";
        displayHour = (hours >= 10) ? "$hours" : "0$hours";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
