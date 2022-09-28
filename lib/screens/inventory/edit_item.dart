import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xylo/compononts/custom,_textfeild.dart';
import 'package:xylo/compononts/custom_drpdown.dart';
import 'package:xylo/compononts/custom_toggle.dart';
import 'package:xylo/compononts/label.dart';
import 'package:xylo/compononts/side_menu.dart';
import 'package:xylo/config.dart';

import '../../compononts/bottombar.dart';

class EditItem extends StatefulWidget {
  const EditItem({Key key}) : super(key: key);

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  String depatValue = "Super Market",
      unitValue = "QTY",
      taxValue = "Tax",
      indexValue = "5 is normal",
      printValue = "HP",
      colorValue;
  int selectedIndex = 0;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      drawer: const SideMenu(),
      bottomSheet: BottomBar(isEdit: true,addButtonAction: () => null),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Label(text: "UPC"),
              CustomTextFeild(
                hint: "123456",
                textInputType: TextInputType.number,
              ),
              Label(text: "ITEM NAME"),
              CustomTextFeild(hint: "Name"),
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
              Label(text: "UPC"),
              buildUploadImage(),
              Label(text: "INITIAL INVENTORY QTY"),
              CustomTextFeild(hint: "Name"),
              Label(text: "UNIT"),
              CustomDropDown(
                items: const ["QTY"],
                value: unitValue,
                onChanged: (value) {
                  setState(() {
                    unitValue = value;
                  });
                },
              ),
              Label(text: "PRINT TO"),
              CustomDropDown(
                items: const ["HP"],
                value: printValue,
                onChanged: (value) {
                  setState(() {
                    printValue = value;
                  });
                },
              ),
              Label(text: "ITEM COLOR"),
              CustomDropDown(
                items: const ["Red"],
                value: colorValue,
                hint: "Select...",
                onChanged: (value) {
                  setState(() {
                    colorValue = value;
                  });
                },
              ),
              Label(text: "TAX CATEGORY"),
              CustomDropDown(
                items: const ["Tax"],
                value: taxValue,
                onChanged: (value) {
                  setState(() {
                    taxValue = value;
                  });
                },
              ),
              Label(text: "PRIORITY INDEX"),
              CustomDropDown(
                items: const ["5 is normal"],
                value: indexValue,
                onChanged: (value) {
                  setState(() {
                    indexValue = value;
                  });
                },
              ),
              Label(text: "EBT ELIGIBLE"),
              CustomToggle(
                index: 1,
              ),
              Label(text: "SHOW IN POS"),
              CustomToggle(
                index: 0,
              ),
              Label(text: "SMALL LINE MODIFIER"),
              CustomToggle(
                index: 2,
              ),
              Label(text: "VALIDATE AGE"),
              CustomToggle(
                index: 2,
              ),
              Label(text: "SHOW IN MOB APP"),
              CustomToggle(
                index: 0,
              ),
              Label(text: "TRACKABLE"),
              CustomToggle(
                index: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildlLabledTextField("COST", "50.25"),
                  buildlLabledTextField("BASIC PRICE", "50.25")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildlLabledTextField("LEVEL 2 PRICE", "50.25"),
                  buildlLabledTextField("LEVEL 3 PRICE", "50.25")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildlLabledTextField("LEVEL 4 PRICE", "50.25"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              "FIXED FREE AMOUNT",
                              style: TextStyle(
                                  color: textheadlinecolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              " *",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      buildTextFeild("50.25")
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "HANDLING/ SHIPPING",
                      style: TextStyle(
                          color: textheadlinecolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      " *",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              buildTextFeild("50.25"),
              Label(text: "FIXED FREE TYPE"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTypeButton("\$", 0),
                  buildTypeButton("%", 1),
                ],
              ),
              buildQtyBox(),
              const SizedBox(
                height: 110,
              )
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
        "Edit Item",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }

  Widget buildUploadImage() {
    return SizedBox(
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
            children: [
              const Text(
                "Upload",
                style: TextStyle(
                    color: kPrymeryColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              InkWell(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  // Pick an image
                  await picker.pickImage(source: ImageSource.gallery);
                },
                child: const Icon(
                  Icons.image,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildQtyBox() {
    return Container(
      height: 55,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.symmetric(vertical: 36),
      decoration: BoxDecoration(
          border: Border.all(color: textheadlinecolor, width: 3),
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/box.png",
            width: 50,
            height: 50,
          ),
          const Text(
            "QTY - IN - BOX",
            style: TextStyle(
                color: textheadlinecolor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )
        ],
      ),
    );
  }

  InkWell buildTypeButton(String text, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 55,
        width: 160,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color:
                selectedIndex == index ? textheadlinecolor : Colors.transparent,
            border: Border.all(color: textheadlinecolor, width: 2),
            borderRadius: BorderRadius.circular(6)),
        child: Text(
          text,
          style: TextStyle(
              color:
                  selectedIndex == index ? kPrymeryColor2 : textheadlinecolor,
              fontWeight: FontWeight.bold,
              fontSize: 28),
        ),
      ),
    );
  }

  Column buildlLabledTextField(String label, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(text: label),
        buildTextFeild(text),
      ],
    );
  }

  SizedBox buildTextFeild(String text) {
    return SizedBox(
      width: 160,
      child: TextFormField(
          initialValue: text,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: kPrymeryColor2),
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.attach_money,
              color: Colors.grey,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: textheadlinecolor, width: 3.0),
              borderRadius: BorderRadius.circular(7.0),
            ),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: textheadlinecolor, width: 3.0),
              borderRadius: BorderRadius.circular(7.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: textheadlinecolor, width: 3.0),
              borderRadius: BorderRadius.circular(7.0),
            ),
          )),
    );
  }
}
