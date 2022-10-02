import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import '../config.dart';

class SearchFeild extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final String hint;
  final Function onChanged;
  const SearchFeild(
      {Key key,
      @required this.controller,
      @required this.width,
      @required this.hint,
      @required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
          color: kPrymeryColor1, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: const Icon(Icons.search),
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: ResponsiveFlutter.of(context).fontSize(1.7)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none),
      ),
    );
  }
}
