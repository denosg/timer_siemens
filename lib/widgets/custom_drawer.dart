import 'package:flutter/material.dart';
import 'package:timer_siemens/screens/stopwatch_screen.dart';
import 'package:timer_siemens/screens/timer_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10)),
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.run_circle),
            title: const Text('Stopwatch'),
            onTap: () {
              Navigator.of(context).pushNamed(StopWatchScreen.routeName);
              Navigator.of(context).pop();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 2,
              color: colors.secondary,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Timer'),
            onTap: () {
              Navigator.of(context).pushNamed(TimerScreen.routeName);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
