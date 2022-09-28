// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/close_btn.dart';
import '../../compononts/custom,_textfeild.dart';
import '../../compononts/custom_drpdown.dart';
import '../../compononts/side_menu.dart';
import '../../config.dart';

class ViewVendor extends StatefulWidget {
  const ViewVendor({Key key}) : super(key: key);

  @override
  State<ViewVendor> createState() => _ViewVendorState();
}

class _ViewVendorState extends State<ViewVendor> {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Label(text: "VENDOR NAME"),
              CustomTextFeild(
                hint: "Name",
                editatbale: false,
              ),
              Label(text: "CONTACT NAME"),
              CustomTextFeild(
                hint: "Name",
                editatbale: false,
              ),
              Label(text: "PHONE NUMBER"),
              CustomTextFeild(
                hint: "12345678920",
                textInputType: TextInputType.phone,
                editatbale: false,
              ),
              Label(text: "EMAIL", visibleStar: false),
              CustomTextFeild(
                hint: "a.sayed@Xylo.lnc",
                textInputType: TextInputType.emailAddress,
                editatbale: false,
              ),
              Label(text: "ADDRESS", visibleStar: false),
              CustomTextFeild(
                hint: "a.sayed@Xylo.lnc",
                textInputType: TextInputType.streetAddress,
                editatbale: false,
                maxLLine: 4,
              ),
              Label(text: "CITY", visibleStar: false),
              const SizedBox(height: 5),
              CustomDropDown(
                editatbale: false,
                items: const ["Califonia"],
                value: selectedCityValue,
                onChanged: (value) {
                  
                },
              ),
              Label(text: "STATE", visibleStar: false),
              CustomDropDown(
                editatbale: false,
                items: const ["Califonia"],
                value: selectedStateValue,
                onChanged: (value) {
                  
                },
              ),
              Label(text: "ZIP CODE", visibleStar: false),
              CustomTextFeild(
                editatbale: false,
                hint: "12345263",
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 120,
              ),
            ],
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
        "View Vendor",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }
}
