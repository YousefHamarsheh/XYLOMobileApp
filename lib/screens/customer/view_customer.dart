// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:xylo/compononts/close_btn.dart';
import 'package:xylo/compononts/custom_textfeild.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/custom_drpdown.dart';
import '../../compononts/side_menu.dart';
import '../../config.dart';

class ViewCustomer extends StatefulWidget {
  const ViewCustomer({Key key}) : super(key: key);

  @override
  State<ViewCustomer> createState() => _ViewCustomerState();
}

class _ViewCustomerState extends State<ViewCustomer> {
  String selectedCityValue = "Califonia";
  String selectedStateValue = "Califonia";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: buildAppbar(),
      bottomSheet: const BottomBackButton(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(text: "CUSTOMER NAME", paddingOn: true),
                CustomTextFeild(
                  hint: "Name",
                  editatbale: false,
                ),
                Label(text: "PHONE NUMBER", paddingOn: true),
                CustomTextFeild(
                    hint: "12345678920",
                    textInputType: TextInputType.phone,
                    editatbale: false),
                Label(text: "Email", visibleStar: false, paddingOn: true),
                CustomTextFeild(
                    hint: "a.sayed@Xylo.lnc",
                    textInputType: TextInputType.emailAddress,
                    editatbale: false),
                Label(text: "ADDRESS", visibleStar: false, paddingOn: true),
                CustomTextFeild(
                    hint: "a.sayed@Xylo.lnc",
                    textInputType: TextInputType.streetAddress,
                    maxLLine: 4,
                    editatbale: false),
                Label(text: "CITY", visibleStar: false, paddingOn: true),
                CustomDropDown(
                  editatbale: false,
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
                  editatbale: false,
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
                  editatbale: false,
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
        "View Customer",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }
}
