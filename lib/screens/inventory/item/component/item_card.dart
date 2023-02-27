import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';

import '../../../../compononts/option.dart';
import '../../../../config.dart';
import '../../../../model/item_data.dart';

class ItemCard extends StatelessWidget {
  final ItemData itemData;
  final Function optionOnTap;
  final double screenHeight;
  final bool optionButton;
  const ItemCard(
      {Key key,
      @required this.itemData,
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
          const SizedBox(
            height: 4,
          ),
          optionButton
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCardTitle(),
                    OptionButton(
                      onPress: () => optionOnTap(),
                    ),
                  ],
                )
              : buildCardTitle(),
          buildCardBottom(context),
        ],
      ),
    );
  }

  Row buildCardTitle() {
    return Row(
      children: [
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(8.0),
        //   child: Image.asset(
        //     "name",
        //     height: 60.0,
        //     width: 60.0,
        //   ),
        // ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemData.txtName,
              style: const TextStyle(
                  fontSize: 22,
                  color: kPrymeryColor2,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              itemData.txtBarcode.toString(),
              style: const TextStyle(fontSize: 13, color: textheadlinecolor),
            ),
          ],
        )
      ],
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
                itemData.productcatTbl.txtNamee,
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
                "In-Stock",
                style: TextStyle(
                    color: Colors.grey,
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                itemData.intProducttype.toString(),
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
                "Price",
                style: TextStyle(
                    color: Colors.grey,
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                itemData.dblCostprice.toString(),
                style: TextStyle(
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    color: textheadlinecolor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
