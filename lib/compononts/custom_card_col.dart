import 'package:flutter/material.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';

import '../config.dart';

class CustomColText extends StatelessWidget {
  final String lable, text;
  const CustomColText({Key? key, required this.lable, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: TextStyle(
              color: Colors.grey,
              // fontSize: ResponsiveFlutter.of(context).fontSize(1.4),
              fontWeight: FontWeight.w500),
        ),
        Text(
          text,
          style: TextStyle(
              // fontSize: ResponsiveFlutter.of(context).fontSize(1.4),
              color: textheadlinecolor),
        ),
      ],
    );
  }
}
