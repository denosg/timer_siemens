import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
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
                    color: Theme.of(context).colorScheme.secondary,
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
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // buttons area for using the timer ->
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // start button ->
                  Expanded(
                    child: RawMaterialButton(
                      // TODO: add functionality here ->
                      onPressed: () {},
                      shape: StadiumBorder(
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                      child: Text(
                        "start",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                  ),
                  // reset button ->
                  Expanded(
                    child: RawMaterialButton(
                      // TODO: add functionality here ->
                      onPressed: () {},
                      shape: StadiumBorder(
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                      child: Text(
                        "reset",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
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
