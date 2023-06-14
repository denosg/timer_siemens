import 'package:flutter/material.dart';

class LogicButton extends StatelessWidget {
  final String text;
  // call back function pointer for the button to work from different screens ->
  final Function() callBackFunc;
  const LogicButton(
      {super.key, required this.text, required this.callBackFunc});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Expanded(
      child: ElevatedButton(
        onPressed: callBackFunc,
        style: ElevatedButton.styleFrom(
            backgroundColor: colors.tertiary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          text,
          style: TextStyle(color: colors.secondary),
        ),
      ),
    );
  }
}
