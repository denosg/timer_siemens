import 'package:flutter/material.dart';
import 'package:timer_siemens/widgets/timer/timer_form.dart';

class NewTimer extends StatefulWidget {
  const NewTimer({super.key});

  @override
  State<NewTimer> createState() => _NewTimerState();
}

class _NewTimerState extends State<NewTimer> {
  @override
  Widget build(BuildContext context) {
    final _modalFormKey = GlobalKey<FormState>();

    final ColorScheme colors = Theme.of(context).colorScheme;

    final height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10),
      child: ListView(
        children: [
          Form(
            key: _modalFormKey,
            child: Column(children: [
              // title
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add a preset timer',
                  style: TextStyle(
                    fontSize: 20,
                    color: colors.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              // time input form field
              const TimerForm(),
            ]),
          ),
        ],
      ),
    );
  }
}
