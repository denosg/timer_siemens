import 'package:flutter/material.dart';

class LogicButton extends StatelessWidget {
  final String text;
  final Function() callBackFunc;
  const LogicButton(
      {super.key, required this.text, required this.callBackFunc});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Expanded(
      child: ElevatedButton(
        // TODO: add functionality here ->
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
