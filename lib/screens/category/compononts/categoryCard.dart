import 'package:flutter/material.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';

import '../../../compononts/option.dart';
import '../../../config.dart';
import '../../../model/category_data .dart';

class CategoryCard extends StatelessWidget {
  final CategoryData categoryData;
  final Function optionOnTap;
  final double screenHeight;
  final bool optionButton;
  const CategoryCard(
      {Key? key,
      required this.categoryData,
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
              Text(
                categoryData.key,
                style: const TextStyle(
                    fontSize: 20,
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
      padding: const EdgeInsets.only(right: 40, top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: TextStyle(
                    color: Colors.grey,
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                categoryData.name,
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
                "Value",
                style: TextStyle(
                    color: Colors.grey,
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                categoryData.percent.toString(),
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
                "Percentage",
                style: TextStyle(
                    color: Colors.grey,
                    // fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: categoryData.is_percent,
                    onChanged: null,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
