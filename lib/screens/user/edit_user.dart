import 'package:flutter/material.dart';

import 'package:flutter_switch/flutter_switch.dart';
import 'package:xylo/compononts/label.dart';
import 'package:xylo/compononts/side_menu.dart';

import '../../compononts/bottombar.dart';
import '../../compononts/custom,_textfeild.dart';
import '../../compononts/custom_drpdown.dart';
import '../../config.dart';

class EditUser extends StatefulWidget {
  const EditUser({Key key}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  bool isPassVisivible = false;
  bool isPinVisivible = false;
  bool selectedUser = false;
  bool selectedClock = false;
  List<bool> radioValue = [
    false,
    false,
    true,
    false,
    true,
    true,
    false,
    false,
    true
  ];
  final TextEditingController textEditingControllerPass =
      TextEditingController();
  final TextEditingController textEditingControllerPIN =
      TextEditingController();
  String selectedValue = "Guest";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      drawer: const SideMenu(),
      bottomSheet: BottomBar(isEdit: true,addButtonAction: () => null),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Label(text: "USER NAME"),
              CustomTextFeild(hint: "Name"),
              Label(text: "PASSWORD"),
              buildPassword(),
              Label(text: "QUICK PIN"),
              buildPIN(),
              Label(text: "PHONE NUMBER"),
              CustomTextFeild(
                hint: "12345678920",
                textInputType: TextInputType.phone,
              ),
              Label(text: "PHONE NUMBER"),
              CustomTextFeild(
                hint: "12345678920",
                textInputType: TextInputType.phone,
              ),
              Label(text: "Email", visibleStar: false),
              CustomTextFeild(
                hint: "a.sayed@Xylo.lnc",
                textInputType: TextInputType.emailAddress,
              ),
              Label(text: "NOTE", visibleStar: false),
              CustomTextFeild(
                hint: "Note",
                maxLLine: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Label(
                        text: "DISABLE USER",
                        visibleStar: false,
                      ),
                      buildSwitch(true),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Label(
                        text: "CLOCK IN/OUT",
                        visibleStar: false,
                      ),
                      buildSwitch(false),
                    ],
                  ),
                ],
              ),
              Label(text: "USER TYPE"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildUserTypeButton("Admin", 170),
                  buildUserTypeButton("Cashier", 170),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildUserTypeButton("Manager", 140),
                  buildUserTypeButton("Clock In/Out Only", 180),
                ],
              ),
              Label(
                text: "USER TYPE LIST",
                visibleStar: false,
              ),
              CustomDropDown(
                items: const ['Guest', 'user1', 'user2'],
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              buildExpendedList(),
              const SizedBox(
                height: 150,
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
        "Edit User",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }

  Widget buildPassword() {
    return TextFormField(
      obscureText: !isPassVisivible,
      controller: textEditingControllerPass,
      decoration: InputDecoration(
        hintText: "********",
        hintStyle: const TextStyle(
            color: kPrymeryColor2, fontWeight: FontWeight.bold, fontSize: 18),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0))),
        suffixIcon: isPassVisivible
            ? InkWell(
                onTap: () {
                  setState(() {
                    isPassVisivible = false;
                  });
                },
                child: const Icon(Icons.visibility))
            : InkWell(
                onTap: () {
                  setState(() {
                    isPassVisivible = true;
                  });
                },
                child: const Icon(Icons.visibility_off)),
      ),
    );
  }

  Widget buildPIN() {
    return TextFormField(
      obscureText: !isPinVisivible,
      controller: textEditingControllerPIN,
      decoration: InputDecoration(
        hintText: "********",
        hintStyle: const TextStyle(
            color: kPrymeryColor2, fontWeight: FontWeight.bold, fontSize: 18),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0))),
        suffixIcon: isPinVisivible
            ? InkWell(
                onTap: () {
                  setState(() {
                    isPinVisivible = false;
                  });
                },
                child: const Icon(Icons.visibility))
            : InkWell(
                onTap: () {
                  setState(() {
                    isPinVisivible = true;
                  });
                },
                child: const Icon(Icons.visibility_off)),
      ),
    );
  }

  Widget buildSwitch(bool isUser) {
    return FlutterSwitch(
      value: isUser ? selectedUser : selectedClock,
      switchBorder: Border.all(color: textheadlinecolor, width: 3),
      width: 170,
      height: 55,
      padding: 8,
      toggleSize: 50,
      borderRadius: 35,
      valueFontSize: 25,
      activeColor: Colors.white,
      inactiveColor: Colors.white,
      toggleColor: Colors.grey,
      activeText: "ON",
      inactiveText: "OFF",
      activeTextColor: Colors.grey,
      inactiveTextColor: Colors.grey,
      showOnOff: true,
      onToggle: (bool value) {
        setState(() {
          isUser ? selectedUser = value : selectedClock = value;
        });
      },
    );
  }

  Card buildExpendedList() {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSalesCard(),
          const Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          buildInventoryCard(),
          const Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          buildUsersCard(),
          const Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          buildToolsCard(),
        ],
      ),
    );
  }

  ExpansionTile buildInventoryCard() {
    return ExpansionTile(
      title: Label(
        text: "INVENTORY",
        visibleStar: false,
        paddingOn: false,
      ),
      children: <Widget>[
        buildRadioLabled(0, "Inventory Management"),
        buildRadioLabled(1, "Add/ Edit Items"),
        buildRadioLabled(2, "Add/Edit Deparment"),
        buildRadioLabled(2, "Barcode Genarate"),
      ],
    );
  }

  ExpansionTile buildUsersCard() {
    return ExpansionTile(
      title: Label(
        text: "USERS",
        visibleStar: false,
        paddingOn: false,
      ),
      children: <Widget>[
        buildRadioLabled(0, "Users Management"),
        buildRadioLabled(1, "User Shift Report"),
        buildRadioLabled(2, "Shifts Reports"),
      ],
    );
  }

  ExpansionTile buildToolsCard() {
    return ExpansionTile(
      title: Label(
        text: "TOOLS",
        visibleStar: false,
        paddingOn: false,
      ),
      children: <Widget>[
        buildRadioLabled(0, "Store Informations"),
        buildRadioLabled(0, "Advanced Reporting"),
      ],
    );
  }

  ExpansionTile buildSalesCard() {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.centerLeft,
      title: Label(
        text: "Sales",
        visibleStar: false,
        paddingOn: false,
      ),
      children: <Widget>[
        buildRadioLabled(0, "Sales Create"),
        buildRadioLabled(1, "Sales Edit /Voide"),
        buildRadioLabled(2, "Sales List"),
        buildRadioLabled(3, "Sales Edit/ Entered Items"),
        buildRadioLabled(4, "Sales Cash Out"),
        buildRadioLabled(5, "Sales Cash In"),
        buildRadioLabled(6, "Sales Create"),
        buildRadioLabled(7, "Sales Edit /Voide"),
        buildRadioLabled(8, "Sales List"),
      ],
    );
  }

  Row buildRadioLabled(int index, String text) {
    return Row(
      children: [
        Checkbox(
            value: radioValue[index],
            onChanged: (bool value) {
              setState(() {
                radioValue[index] = value;
              });
            }),
        Text(
          " $text",
          style: TextStyle(
              color: radioValue[index] ? kPrymeryColor2 : Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Container buildUserTypeButton(String text, double width) {
    return Container(
      height: 55,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),
      ),
    );
  }
}
