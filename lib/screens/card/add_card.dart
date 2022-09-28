// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom,_textfeild.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/side_menu.dart';
import '../../config.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String selectedCityValue = "Califonia";
  String selectedStateValue = "Califonia";
  bool val1 = false;
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
                Label(text: "REFFERENCE", paddingOn: true),
                CustomTextFeild(hint: "Ref"),
                Label(text: "DESCRIPTION", paddingOn: true),
                CustomTextFeild(
                  hint: "Dec...",
           
                ),
                Label(text: "Commision Percentage", paddingOn: true),
                CustomTextFeild(
                  hint: "0.3",
           
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: val1,
                        onChanged: (val) {
                          setState(() {
                            val1 = val;
                          });
                        }),
                    const Text(
                      "Merchant Afford",
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
        "Add New Credit Card",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }
}
