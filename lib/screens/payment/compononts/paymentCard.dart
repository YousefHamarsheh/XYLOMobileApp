import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:xylo/model/shift_data.dart';

import '../../../compononts/option.dart';
import '../../../config.dart';
import '../../../model/payment_data.dart';

class PaymentCard extends StatelessWidget {
  final PaymentData paymentData;
  final Function optionOnTap;
  final double screenHeight;
  final bool optionButton;
  const PaymentCard(
      {Key? key,
      required this.paymentData,
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
                    paymentData.int_type.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        color: kPrymeryColor2,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    paymentData.int_type.toString(),
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
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
                "Note",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                paymentData.int_type.toString(),
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    color: textheadlinecolor),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Active",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: paymentData.active,
                    onChanged: null,
                  ))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pay Out",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: paymentData.active,
                    onChanged: null,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
