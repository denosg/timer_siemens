import 'package:flutter/material.dart';
import 'package:timer_siemens/widgets/logic_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Center Title of app
              Center(
                child: Text(
                  "Timer",
                  style: TextStyle(
                    color: colors.secondary,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // TODO: write doc here ->
              Container(
                // half the size of the screen
                height: height * 0.5,
                decoration: BoxDecoration(
                  color: colors.tertiary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // buttons area for using the timer ->
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // start button ->
                  LogicButton(
                    text: "start",
                    // TODO: add functionality here ->
                    callBackFunc: () {},
                  ),
                  // reset button ->
                  LogicButton(
                    text: "reset",
                    // TODO: add functionality here ->
                    callBackFunc: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
