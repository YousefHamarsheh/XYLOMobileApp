import 'package:flutter/material.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';

import '../config.dart';

class TransCard extends StatelessWidget {
  final String date, number, amount;
  const TransCard({Key key, @required this.date, @required this.number, @required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = ((MediaQuery.of(context).size.width) -
        45); //Get device width for card size
    return Container(
      width: width,
      
      margin: const EdgeInsets.only(bottom: 12, left: 2, right: 2),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Document Date",
                  style: TextStyle(
                      color: Colors.grey,
                      // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  date,
                  style: TextStyle(
                      // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                      color: textheadlinecolor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Document Num",
                  style: TextStyle(
                      color: Colors.grey,
                      // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  number,
                  style: TextStyle(
                      // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                      color: textheadlinecolor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Amount",
                  style: TextStyle(
                      color: Colors.grey,
                      // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  amount,
                  style: TextStyle(
                      // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
