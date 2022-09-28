// This widget for Vendor, Customer, User list card

import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import '../config.dart';
import 'option.dart';

class CustomCard extends StatelessWidget {
  final String text, value;
  final Function option;
  const CustomCard(
      {Key key,
      @required this.text,
      @required this.value,
      @required this.option})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = ((MediaQuery.of(context).size.width) - 45);
    return Container(
      width: width,
      height: 90,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 207, 206, 206),
              blurRadius: 3,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(text,
                    style: TextStyle(
                        color: const Color(0xff1fa5cf),
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 7, top: 3),
                child: Text(value,
                    style: TextStyle(
                        color: textheadlinecolor,
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          OptionButton(
            onPress: option,
          ),
        ],
      ),
    );
  }
}
