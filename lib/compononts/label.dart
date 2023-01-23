import 'package:flutter/material.dart';

import '../config.dart';

class Label extends StatelessWidget {
  String text;
  bool visibleStar;
  bool paddingOn;
  Label(
      {Key? key,
      required this.text,
      this.visibleStar = true,
      this.paddingOn = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: paddingOn ? 30 : 0, bottom: paddingOn ? 5 : 0),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
                color: textheadlinecolor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Visibility(
            visible: visibleStar,
            child: const Text(
              "*",
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
