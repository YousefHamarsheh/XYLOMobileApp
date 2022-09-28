// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom,_textfeild.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/side_menu.dart';
import '../../config.dart';

class AddTerminal extends StatefulWidget {
  const AddTerminal({Key key}) : super(key: key);

  @override
  State<AddTerminal> createState() => _AddTerminalState();
}

class _AddTerminalState extends State<AddTerminal> {

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
                Label(text: "KEY", paddingOn: true),
                CustomTextFeild(hint: "002"),
                Label(text: "MERCHANT ID", paddingOn: true),
                CustomTextFeild(
                  hint: "Tax 02",
                ),
                Label(text: "DESCRIPTION", paddingOn: true),
                CustomTextFeild(
                  hint: "Dec...",
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
                      "Active",
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
        "Add New Terminal",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }
}
