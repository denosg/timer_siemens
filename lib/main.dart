import 'package:flutter/material.dart';

import '/screens/home_screen.dart';
import '/themes/theme.dart';

//TODO: Use Riverpod state management do display the previous timers in a separate screen

void main() {
  runApp(const MyApp());
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
      home: const HomeScreen(),
      routes: {},
    );
  }
}
