import 'package:flutter/material.dart';


import 'package:flutter_switch/flutter_switch.dart';
import 'package:xylo/config.dart';

class ToggleButton extends StatelessWidget {
  ValueChanged<dynamic> onToggle;
  final bool value;
  ToggleButton({Key key, @required this.value, @required this.onToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        activeColor: kPrymeryColor2,
        inactiveColor: Colors.grey,
        activeText: ("ON"),
        inactiveText: ("OFF"),
        value: value,
        showOnOff: true,
        toggleSize: 30,
        onToggle: (val) {
          onToggle(val);
        });
  }
}
