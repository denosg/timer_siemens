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
              SizedBox(height: height * 0.02),
              // Timer
              Center(
                  child: Text(
                "00:00:00",
                style: TextStyle(
                  color: colors.tertiary,
                  fontSize: 80,
                  fontWeight: FontWeight.w600,
                ),
              )),
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
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // start button ->
                  LogicButton(
                    text: "start",
                    // TODO: add functionality here ->
                    callBackFunc: () {},
                  ),
                  // lap button ->
                  SizedBox(width: width * 0.02),
                  IconButton(
                    // TODO: add functionality here ->
                    onPressed: () {},
                    color: Colors.white,
                    icon: const Icon(Icons.flag),
                  ),
                  SizedBox(width: width * 0.02),
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
