import 'package:flutter/material.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:xylo/compononts/custom_card_col.dart';
import 'package:xylo/model/clock_data.dart';

import '../../../compononts/option.dart';
import '../../../config.dart';

class ClockCard extends StatelessWidget {
  final ClockData clockData;
  final Function optionOnTap;
  final double screenHeight;
  final bool optionButton;
  const ClockCard(
      {Key key,
      this.clockData,
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
                clockData.userCode,
                style: const TextStyle(
                    fontSize: 18,
                    color: kPrymeryColor2,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clockData.deviceName,
                    style: const TextStyle(
                        fontSize: 17,
                        color: kPrymeryColor2,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  OptionButton(
                    padding: 16,
                    onPress: () => optionOnTap(),
                  ),
                ],
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
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: CustomColText(
              lable: "Date",
              text: clockData.date,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: CustomColText(
              lable: "From Time",
              text: clockData.fromtime,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: CustomColText(
              lable: "To Time",
              text: clockData.toTime,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Status",
                style: TextStyle(
                    color: Colors.grey,
                    // fontSize: ResponsiveFlutter.of(context).fontSize(1.4),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                clockData.status,
                style: TextStyle(
                    // fontSize: ResponsiveFlutter.of(context).fontSize(1.4),
                    color:
                        clockData.status == "Out" ? Colors.red : Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
