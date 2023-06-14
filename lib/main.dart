import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_siemens/screens/timer_screen.dart';

import 'screens/stopwatch_screen.dart';
import '/themes/theme.dart';

//TODO FIX countdown logic

void main() {
  //Makes it so SystemChrome.setPreferredOrientations works
  WidgetsFlutterBinding.ensureInitialized();
  //Sets preffered orientations
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //Runs the app on boot
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const StopWatchScreen(),
      routes: {
        // Stopwatch Screen
        StopWatchScreen.routeName: (context) => const StopWatchScreen(),
        // Timer Screen
        TimerScreen.routeName: (context) => const TimerScreen(),
      },
    );
  }
}
