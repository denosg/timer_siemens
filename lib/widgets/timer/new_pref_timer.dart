import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// new pref timer alert dialog content
class NewTimer extends StatefulWidget {
  final Function(String) onHoursChanged;
  final Function(String) onMinutesChanged;
  final Function(String) onSecondsChanged;
  const NewTimer({
    super.key,
    required this.onHoursChanged,
    required this.onMinutesChanged,
    required this.onSecondsChanged,
  });

  @override
  State<NewTimer> createState() => _NewTimerState();
}

class _NewTimerState extends State<NewTimer> {
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
    final modalFormKey = GlobalKey<FormState>();

    final ColorScheme colors = Theme.of(context).colorScheme;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Form(
      key: modalFormKey,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        height: height * 0.08,
        child: Center(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              // hours form
              Container(
                padding: EdgeInsets.all(width * 0.03),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: colors.tertiary),
                width: width * 0.14,
                child: TextFormField(
                  controller: _hoursController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'HH',
                    hintStyle: TextStyle(color: colors.secondary),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => widget.onHoursChanged(value),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                ),
              ),
              const Text(':', style: TextStyle(fontSize: 20)),

              // minutes form
              Container(
                padding: EdgeInsets.all(width * 0.03),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: colors.tertiary),
                width: width * 0.14,
                child: TextFormField(
                  controller: _minutesController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'MM',
                    hintStyle: TextStyle(color: colors.secondary),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => widget.onMinutesChanged(value),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                ),
              ),
              const Text(':', style: TextStyle(fontSize: 20)),

              // seconds form
              Container(
                padding: EdgeInsets.all(width * 0.03),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: colors.tertiary),
                width: width * 0.14,
                child: TextFormField(
                  controller: _secondsController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'SS',
                    hintStyle: TextStyle(color: colors.secondary),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => widget.onSecondsChanged(value),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
