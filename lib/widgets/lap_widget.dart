import 'package:flutter/material.dart';

class LapWidget extends StatefulWidget {
  final String time;
  final int index;
  const LapWidget({super.key, required this.time, required this.index});

  @override
  State<LapWidget> createState() => _LapWidgetState();
}

class _LapWidgetState extends State<LapWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // init state for the animation to start
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  // dispose memory for animation
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return AnimatedOpacity(
      opacity: _animation.value,
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Lap: ${widget.index + 1}: ',
                  style: TextStyle(
                    color: colors.secondary,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  widget.time,
                  style: TextStyle(
                    color: colors.secondary,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(thickness: 2, color: colors.secondary),
          ),
        ],
      ),
    );
  }
}
