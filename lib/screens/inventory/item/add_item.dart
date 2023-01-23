import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xylo/compononts/custom_textfeild.dart';
import 'package:xylo/compononts/custom_drpdown.dart';
import 'package:xylo/compononts/custom_toggle.dart';
import 'package:xylo/compononts/label.dart';
import 'package:xylo/compononts/side_menu.dart';
import 'package:xylo/config.dart';

import '../../../compononts/bottombar.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String depatValue = "Super Market",
      unitValue = "QTY",
      taxValue = "Tax",
      indexValue = "5 is normal",
      printValue = "HP";
  late String colorValue;
  int selectedIndex = 0;
  String upc = "upc";
  String itemName = "itemName";
  int initQty = 0;
  String ebt = "ebt";
  String showInPos = "showInPos";
  String modifyer = "modifyer";
  String age = "age";
  String showInMob = "showInMob";
  String trackable = "trackable";
  late double cost,
      basicPrice,
      lev2Price,
      lev3Price,
      lev4Price,
      fixedFree,
      handlingShip;
  String fixedFreeType = "fixedFreeType";
  late File imageFile;
  late String imageDataEn;
  String uploadCheck = "Upload";
  final _keyForm = GlobalKey<FormState>();
  Future<void> _savingData() async {
    final validation = _keyForm.currentState!.validate();
    if (validation) {
      _keyForm.currentState!.save();
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      drawer: const SideMenu(),
      bottomSheet: BottomBar(addButtonAction: () => _savingData()),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Form(
              key: _keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label(text: "UPC"),
                  CustomTextFeild(
                    hint: "123456",
                    textInputType: TextInputType.number,
                    onSaved: (value) => null,
                  ),
                  Label(text: "ITEM NAME"),
                  CustomTextFeild(
                    hint: "Name",
                    onSaved: (value) => null,
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
                  Label(text: "UPC"),
                  buildUploadImage(),
                  Label(text: "INITIAL INVENTORY QTY"),
                  CustomTextFeild(
                    hint: "1234",
                    textInputType: TextInputType.number,
                    onSaved: (value) => null,
                  ),
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
                    onSaved: (value) => ebt = value,
                  ),
                  Label(text: "SHOW IN POS"),
                  CustomToggle(index: 0, onSaved: (value) => showInPos = value),
                  Label(text: "SMALL LINE MODIFIER"),
                  CustomToggle(index: 2, onSaved: (value) => modifyer = value),
                  Label(text: "VALIDATE AGE"),
                  CustomToggle(index: 2, onSaved: (value) => age = value),
                  Label(text: "SHOW IN MOB APP"),
                  CustomToggle(index: 0, onSaved: (value) => showInMob = value),
                  Label(text: "TRACKABLE"),
                  CustomToggle(index: 1, onSaved: (value) => trackable = value),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildlLabledTextField("COST", "50.25", "costType"),
                      buildlLabledTextField("BASIC PRICE", "50.25", "basicType")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildlLabledTextField(
                          "LEVEL 2 PRICE", "50.25", "lev2Type"),
                      buildlLabledTextField(
                          "LEVEL 3 PRICE", "50.25", "lev3Type")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildlLabledTextField(
                          "LEVEL 4 PRICE", "50.25", "lev4Type"),
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
                          buildTextFeild("50.25", "fixedAmountType")
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
                  buildTextFeild("50.25", "handleType"),
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
            )),
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: kPrymeryColor1,
      foregroundColor: textheadlinecolor,
      title: const Text(
        "Add New Item",
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

                  var picked_image =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (picked_image != null) {
                    setState(() {
                      imageFile = File(picked_image.path);
                      uploadCheck = "Image Uploaded";
                    });
                    imageDataEn = base64Encode(imageFile.readAsBytesSync());
                    // print(imageDataEn);
                  } else {
                    imageFile = File("assets/images/alert.png");
                    imageDataEn = base64Encode(imageFile.readAsBytesSync());
                  }
                },
                child: showIsImageUpload(),
                // const Icon(
                //   Icons.image,
                //   size: 35,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showImage(String image) {
    return Image.memory(base64Decode(image));
  }

  showIsImageUpload() {
    if (uploadCheck.compareTo("Upload") == 0) {
      return const Icon(
        Icons.image,
        size: 35,
      );
    } else {
      return Container(
        child: showImage(imageDataEn),
        width: 70,
        height: 70,
      );
    }
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
    double width = MediaQuery.of(context).size.width / 2 - 50;
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if (selectedIndex == 0) {
            fixedFreeType = "dollar";
          } else {
            fixedFreeType = "percent";
          }
        });
      },
      child: Container(
        height: 55,
        width: width,
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

  Column buildlLabledTextField(String label, String text, String type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(text: label),
        buildTextFeild(text, type),
      ],
    );
  }

  SizedBox buildTextFeild(String text, String type) {
    double width = MediaQuery.of(context).size.width / 2 - 50;
    return SizedBox(
      width: width,
      child: TextFormField(
          onSaved: (value) {
            if (type.compareTo("costType") == 0) {
              cost = double.parse(value!);
            } else if (type.compareTo("basicType") == 0) {
              basicPrice = double.parse(value!);
            } else if (type.compareTo("lev2ype") == 0) {
              lev2Price = double.parse(value!);
            } else if (type.compareTo("lev3Type") == 0) {
              lev3Price = double.parse(value!);
            } else if (type.compareTo("lev4Type") == 0) {
              lev4Price = double.parse(value!);
            } else if (type.compareTo("fixedAmountType") == 0) {
              fixedFree = double.parse(value!);
            } else if (type.compareTo("handleType") == 0) {
              handlingShip = double.parse(value!);
            }
          },
          // initialValue: text,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: kPrymeryColor2),
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.attach_money,
              color: Colors.grey,
            ),
            hintText: text,
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
