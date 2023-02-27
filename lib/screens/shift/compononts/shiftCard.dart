import 'package:flutter/material.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:xylo/model/shift_data.dart';

import '../../../compononts/option.dart';
import '../../../config.dart';

class ShiftCard extends StatelessWidget {
  final ShiftData shiftData;
  final Function optionOnTap;
  final double screenHeight;
  final bool optionButton;
  const ShiftCard(
      {Key key,
      this.shiftData,
      this.optionOnTap,
      @required this.screenHeight,
      @required this.optionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
          ]),
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shiftData.txtUsername,
                style: const TextStyle(
                    fontSize: 22,
                    color: kPrymeryColor2,
                    fontWeight: FontWeight.bold),
              ),
              OptionButton(
                padding: 16,
                onPress: () => optionOnTap(),
              ),
            ],
          ),
          buildCardBottom(context),
        ],
      ),
    );
  }

  Widget buildCardBottom(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Open Date",
                style: TextStyle(
                    color: Colors.grey,
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                shiftData.datOpendate,
                style: TextStyle(
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    color: textheadlinecolor),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Open Time",
                style: TextStyle(
                    color: Colors.grey,
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                shiftData.timOpentime,
                style: TextStyle(
                  // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                  color: textheadlinecolor,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Status",
                style: TextStyle(
                    color: Colors.grey,
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                shiftData.status,
                style: TextStyle(
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    color: shiftData.status == "Closed"
                        ? Colors.red
                        : Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
