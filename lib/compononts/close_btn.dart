// ignore_for_file: missing_return


import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class BottomBackButton extends StatelessWidget {
  const BottomBackButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return  Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, bottom: 8, top: 24),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 55,
            width: double.maxFinite,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(6)),
            child: Text(
              'Close',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
  }
}