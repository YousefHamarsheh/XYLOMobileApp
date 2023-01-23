// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom_textfeild.dart';
import 'package:xylo/compononts/label.dart';

import '../../../compononts/close_btn.dart';
import '../../../compononts/custom_drpdown.dart';
import '../../../compononts/side_menu.dart';
import '../../../compononts/toggle_btn.dart';
import '../../../config.dart';

class ViewDepart extends StatefulWidget {
  const ViewDepart({Key? key}) : super(key: key);

  @override
  State<ViewDepart> createState() => _ViewDepartState();
}

class _ViewDepartState extends State<ViewDepart> {
  List<bool> selected = [false, false, true, false, false];
  String selectedTaxValue = "Tax";
  String selectedAgeValue = "21 Years Old";
  String selectedIndexValue = "5 is normal";
  String selectedPrinterValue = "HP Printer";
  late String selectedColorValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: buildAppbar(),
      bottomSheet: const BottomBackButton(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Label(text: "DEP NAME"),
            CustomTextFeild(editatbale: false, hint: "Name"),
            Label(text: "PRINT TO"),
            CustomDropDown(
              editatbale: false,
              items: const ["HP Printer"],
              value: selectedPrinterValue,
              onChanged: (value) {},
            ),
            Label(text: "DESPLAY ON SCREEN"),
            CustomTextFeild(editatbale: false, hint: "Name"),
            Label(text: "PRIORITY INDEX"),
            CustomDropDown(
              editatbale: false,
              items: const ["5 is normal"],
              value: selectedIndexValue,
              onChanged: (value) {},
            ),
            Label(text: "PARENT DEPARTMENT"),
            CustomTextFeild(editatbale: false, hint: "Name"),
            Label(text: "RESTRICTED AGE"),
            CustomDropDown(
              editatbale: false,
              items: const ["21 Years Old"],
              value: selectedAgeValue,
              onChanged: (value) {},
            ),
            Label(text: "DEPARTMENT IMAGE"),
            buildDepartImage(),
            Label(text: "DEPARTMENT COLOR"),
            CustomDropDown(
              editatbale: false,
              items: const ["Red"],
              value: selectedColorValue,
              hint: "Select...",
              onChanged: (value) {},
            ),
            Label(text: "TAX CATEGORY"),
            CustomDropDown(
              editatbale: false,
              items: const ["Tax"],
              value: selectedTaxValue,
              onChanged: (value) {},
            ),
            buildToggle(0, "SHOW IN POS"),
            buildToggle(
              1,
              "SHOW IN MOB APP",
            ),
            buildToggle(
              2,
              "EBT ELIGIBLE",
            ),
            buildToggle(
              3,
              "MODIFYER",
            ),
            buildToggle(
              4,
              "EXPRESS BUTTON",
            ),
            const SizedBox(
              height: 120,
            ),
          ]),
        ),
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: kPrymeryColor1,
      foregroundColor: textheadlinecolor,
      title: const Text(
        "View Department",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }

  Widget buildToggle(int index, String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        height: 62,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Label(
                text: label,
                paddingOn: false,
              ),
              ToggleButton(value: selected[index], onToggle: (value) {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDepartImage() {
    return Container(
      height: 100,
      width: double.maxFinite,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Image.asset("assets/images/mainLogo.png"),
    );
  }
}
