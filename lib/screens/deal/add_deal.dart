// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom,_textfeild.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/custom_drpdown.dart';
import '../../compononts/side_menu.dart';
import '../../config.dart';

class AddDeal extends StatefulWidget {
  const AddDeal({Key key}) : super(key: key);

  @override
  State<AddDeal> createState() => _AddDealState();
}

class _AddDealState extends State<AddDeal> {
  String depatValue = "Super Market";
  bool val1 = false;
  TextEditingController textEditingControllerFrom = TextEditingController();
  TextEditingController textEditingControllerTo = TextEditingController();
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
                Label(text: "DEAL NAME", paddingOn: true),
                CustomTextFeild(
                  hint: "Name",
                ),
                Label(text: "DEPARTMENT"),
                CustomDropDown(
                  items: const ["Super Market"],
                  value: depatValue,
                  onChanged: (value) {
                    setState(() {
                      depatValue = value;
                    });
                  },
                ),
                Label(text: "FROM DATE"),
                InkWell(
                  onTap: () async {
                    final DateTime picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime(2101));
                    if (picked != null) {
                      setState(() {
                        textEditingControllerFrom.text =
                            "${picked.day} - ${picked.month} - ${picked.year}";
                      });
                    }
                  },
                  child: CustomTextFeild(
                    editatbale: false,
                    controller: textEditingControllerFrom,
                  ),
                ),
                Label(text: "TO DATE"),
                InkWell(
                  onTap: () async {
                    final DateTime picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime(2101));
                    if (picked != null) {
                      setState(() {
                        textEditingControllerTo.text =
                            "${picked.day} - ${picked.month} - ${picked.year}";
                      });
                    }
                  },
                  child: CustomTextFeild(
                    editatbale: false,
                    controller: textEditingControllerTo,
                  ),
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
        "Add New Deal",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }
}
