// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom,_textfeild.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/custom_drpdown.dart';
import '../../compononts/side_menu.dart';
import '../../config.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({Key key}) : super(key: key);

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  String selectedCityValue = "Califonia";
  String selectedStateValue = "Califonia";
  bool val1 = false, val2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: buildAppbar(),
      bottomSheet: BottomBar(addButtonAction: () => null),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(text: "TYPE NO", paddingOn: true),
                CustomTextFeild(hint: "Type"),
                Label(text: "DESCRIPTION", paddingOn: true),
                CustomTextFeild(
                  hint: "Desc....",
                ),
                Label(text: "Note", visibleStar: false, paddingOn: true),
                CustomTextFeild(
                  hint: "Note...",
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Checkbox(value: val1, onChanged: (val) {setState(() {
                            val1 = val;
                          });}),
                    const Text(
                      "Active",
                      style: TextStyle(
                          color: textheadlinecolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Checkbox(
                        value: val2,
                        onChanged: (val) {
                          setState(() {
                            val2 = val;
                          });
                        }),
                    const Text(
                      "Pay Out",
                      style: TextStyle(
                          color: textheadlinecolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 140,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: kPrymeryColor1,
      foregroundColor: textheadlinecolor,
      title: const Text(
        "Add New Payment",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }
}
