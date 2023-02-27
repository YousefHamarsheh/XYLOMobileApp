import 'package:flutter/material.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:xylo/model/deals_data.dart';

import '../../../compononts/option.dart';
import '../../../config.dart';
import '../../../model/item_data.dart';

class DealCard extends StatelessWidget {
  final DealsData dealData;
  final Function optionOnTap;
  final double screenHeight;
  final bool optionButton;
  const DealCard(
      {Key key,
      @required this.dealData,
      @required this.optionOnTap,
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
          optionButton
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCardTitle(),
                    OptionButton(
                      onPress: () => optionOnTap(),
                      padding: 8,
                    ),
                  ],
                )
              : buildCardTitle(),
          buildCardBottom(context),
        ],
      ),
    );
  }

  Text buildCardTitle() {
    return Text(
      dealData.name,
      style: const TextStyle(
          fontSize: 22, color: kPrymeryColor2, fontWeight: FontWeight.bold),
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
                "Department",
                style: TextStyle(
                    color: Colors.grey,
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                dealData.name,
                style: TextStyle(
                    // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                    color: textheadlinecolor),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "From Date",
                style: TextStyle(
                    color: Colors.grey,
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                dealData.from_date,
                style: TextStyle(
                  // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                  color: textheadlinecolor,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "To Date",
                style: TextStyle(
                    color: Colors.grey,
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                dealData.to_date,
                style: TextStyle(
                    // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                    color: textheadlinecolor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
