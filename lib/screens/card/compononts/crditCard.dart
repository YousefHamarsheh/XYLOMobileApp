import 'package:flutter/material.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';

import '../../../compononts/option.dart';
import '../../../config.dart';
import '../../../model/card_data.dart';

class CreditCard extends StatelessWidget {
  final CardData cardData;
  final Function optionOnTap;
  final double screenHeight;
  final bool optionButton;
  const CreditCard(
      {Key? key,
      required this.cardData,
      required this.optionOnTap,
      required this.screenHeight,
      required this.optionButton})
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardData.description,
                    style: const TextStyle(
                        fontSize: 20,
                        color: kPrymeryColor2,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              OptionButton(
                padding: 16,
                onPress: () => optionOnTap(),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          buildCardBottom(context),
        ],
      ),
    );
  }

  Widget buildCardBottom(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Comm. Percentage",
                style: TextStyle(
                    color: Colors.grey,
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                cardData.commissionPercentage.toString(),
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
                "Merchant Afford",
                style: TextStyle(
                    color: Colors.grey,
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: cardData.merchantAfford,
                    onChanged: null,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
