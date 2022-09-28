// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom,_textfeild.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/custom_drpdown.dart';
import '../../compononts/side_menu.dart';
import '../../config.dart';

class EditCustomer extends StatefulWidget {
  const EditCustomer({Key key}) : super(key: key);

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  String selectedCityValue = "Califonia";
  String selectedStateValue = "Califonia";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: buildAppbar(),
      bottomSheet: BottomBar(isEdit: true, addButtonAction: () => null),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(text: "CUSTOMER NAME", paddingOn: true),
                CustomTextFeild(hint: "Name"),
                Label(text: "PHONE NUMBER", paddingOn: true),
                CustomTextFeild(
                  hint: "12345678920",
                  textInputType: TextInputType.phone,
                ),
                Label(text: "Email", visibleStar: false, paddingOn: true),
                CustomTextFeild(
                  hint: "a.sayed@Xylo.lnc",
                  textInputType: TextInputType.emailAddress,
                ),
                Label(text: "ADDRESS", visibleStar: false, paddingOn: true),
                CustomTextFeild(
                  hint: "a.sayed@Xylo.lnc",
                  textInputType: TextInputType.streetAddress,
                  maxLLine: 4,
                ),
                Label(text: "CITY", visibleStar: false, paddingOn: true),
                CustomDropDown(
                  items: const ["Califonia"],
                  value: selectedCityValue,
                  onChanged: (value) {
                    setState(() {
                      selectedCityValue = value;
                    });
                  },
                ),
                Label(text: "STATE", visibleStar: false, paddingOn: true),
                CustomDropDown(
                  items: const ["Califonia"],
                  value: selectedStateValue,
                  onChanged: (value) {
                    setState(() {
                      selectedStateValue = value;
                    });
                  },
                ),
                Label(text: "ZIP CODE", visibleStar: false, paddingOn: true),
                CustomTextFeild(
                  hint: "12345263",
                  textInputType: TextInputType.number,
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
        "Edit Customer",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }
}
