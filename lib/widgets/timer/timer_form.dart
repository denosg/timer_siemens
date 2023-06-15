import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class TimerForm extends StatefulWidget {
  const TimerForm({super.key});

  @override
  State<TimerForm> createState() => _TimerFormState();
}

class _TimerFormState extends State<TimerForm> {
  late TextEditingController _hoursController;
  late TextEditingController _minutesController;
  late TextEditingController _secondsController;

  @override
  void initState() {
    super.initState();
    _hoursController = TextEditingController(text: '00');
    _minutesController = TextEditingController(text: '30');
    _secondsController = TextEditingController(text: '00');
  }

  @override
  void dispose() {
    _hoursController.dispose();
    _minutesController.dispose();
    _secondsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: TextFormField(
              controller: _hoursController,
              decoration: const InputDecoration(hintText: 'HH'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
            ),
          ),
          const Text(':', style: TextStyle(fontSize: 20)),
          SizedBox(
            width: 50,
            child: TextFormField(
              controller: _minutesController,
              decoration: const InputDecoration(hintText: 'MM'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
            ),
          ),
          const Text(':', style: TextStyle(fontSize: 20)),
          SizedBox(
            width: 50,
            child: TextFormField(
              controller: _secondsController,
              decoration: const InputDecoration(hintText: 'SS'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
