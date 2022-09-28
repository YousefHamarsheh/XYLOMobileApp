// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom,_textfeild.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/custom_drpdown.dart';
import '../../compononts/side_menu.dart';
import '../../compononts/toggle_btn.dart';
import '../../config.dart';

class AddDEpart extends StatefulWidget {
  const AddDEpart({Key key}) : super(key: key);

  @override
  State<AddDEpart> createState() => _AddDEpartState();
}

class _AddDEpartState extends State<AddDEpart> {
  List<bool> selected = [false, false, false, false, false];
  String selectedTaxValue = "Tax";
  String selectedAgeValue = "21 Years Old";
  String selectedIndexValue = "5 is normal";
  String selectedPrinterValue = "HP Printer";
  String selectedColorValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: buildAppbar(),
      bottomSheet: BottomBar(addButtonAction: () => null),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Label(text: "DEP NAME"),
            CustomTextFeild(hint: "Name"),
            Label(text: "PRINT TO"),
            CustomDropDown(
              items: const ["HP Printer"],
              value: selectedPrinterValue,
              onChanged: (value) {
                setState(() {
                  selectedPrinterValue = value;
                });
              },
            ),
            Label(text: "DESPLAY ON SCREEN"),
            CustomTextFeild(hint: "Name"),
            Label(text: "PRIORITY INDEX"),
            CustomDropDown(
              items: const ["5 is normal"],
              value: selectedIndexValue,
              onChanged: (value) {
                setState(() {
                  selectedIndexValue = value;
                });
              },
            ),
            Label(text: "PARENT DEPARTMENT"),
            CustomTextFeild(hint: "Name"),
            Label(text: "RESTRICTED AGE"),
            CustomDropDown(
              items: const ["21 Years Old"],
              value: selectedAgeValue,
              onChanged: (value) {
                setState(() {
                  selectedAgeValue = value;
                });
              },
            ),
            Label(text: "DEPARTMENT IMAGE"),
            buildUploadImage(),
            Label(text: "DEPARTMENT COLOR"),
            CustomDropDown(
              items: const ["Red"],
              value: selectedColorValue,
              hint: "Select...",
              onChanged: (value) {
                setState(() {
                  selectedColorValue = value;
                });
              },
            ),
            Label(text: "TAX CATEGORY"),
            CustomDropDown(
              items: const ["Tax"],
              value: selectedTaxValue,
              onChanged: (value) {
                setState(() {
                  selectedTaxValue = value;
                });
              },
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
        "Add New Department",
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
              ToggleButton(
                  value: selected[index],
                  onToggle: (value) {
                    setState(() {
                      selected[index] = value;
                      print(value);
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUploadImage() {
    return InkWell(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        // Pick an image
        await picker.pickImage(source: ImageSource.gallery);
      },
      child: SizedBox(
        height: 62,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Upload",
                  style: TextStyle(
                      color: kPrymeryColor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Icon(
                  Icons.image,
                  size: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
