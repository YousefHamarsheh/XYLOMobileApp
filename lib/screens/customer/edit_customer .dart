// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:xylo/actions/CustActions.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom_textfeild.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/custom_drpdown.dart';
import '../../compononts/side_menu.dart';
import '../../config.dart';

class EditCustomer extends StatefulWidget {
  final String name, id, phonenumber, email, address, city, state, zipcode;
  const EditCustomer(
      {Key key,
      @required this.name,
      @required this.id,
      @required this.phonenumber,
      @required this.email,
      @required this.address,
      @required this.city,
      @required this.state,
      @required this.zipcode})
      : super(key: key);

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  CustActions custActions = CustActions();
  String selectedCityValue = "Califonia";
  String selectedStateValue = "Califonia";
  String custName = "name";
  String custNumber = "number";
  String custEmail = "email";
  String custAddress = "address";
  String custZipcode = "zipcode";
  final _keyForm = GlobalKey<FormState>();

  Future<void> _savingData() async {
    final validation = _keyForm.currentState.validate();
    if (validation) {
      _keyForm.currentState.save();
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: buildAppbar(),
      bottomSheet: BottomBar(
          isEdit: true,
          addButtonAction: () => _savingData().then((value) =>
              custActions.updateCustomer(
                  custAddress,
                  custZipcode,
                  selectedCityValue,
                  selectedStateValue,
                  custEmail,
                  custName,
                  custNumber,
                  widget.id))),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
              child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(text: "CUSTOMER NAME", paddingOn: true),
                CustomTextFeild(
                  hint: widget.name,
                  initValue: widget.name,
                  onSaved: (value) => custName = value,
                ),
                Label(text: "PHONE NUMBER", paddingOn: true),
                CustomTextFeild(
                  hint: widget.phonenumber,
                  initValue: widget.phonenumber,
                  textInputType: TextInputType.phone,
                  onSaved: (value) => custNumber = value,
                ),
                Label(text: "Email", visibleStar: false, paddingOn: true),
                CustomTextFeild(
                  hint: widget.phonenumber,
                  initValue: widget.email,
                  textInputType: TextInputType.emailAddress,
                  onSaved: (value) => custEmail = value,
                ),
                Label(text: "ADDRESS", visibleStar: false, paddingOn: true),
                CustomTextFeild(
                  hint: widget.address,
                  initValue: widget.address,
                  textInputType: TextInputType.streetAddress,
                  maxLLine: 4,
                  onSaved: (value) => custAddress = value,
                ),
                Label(text: "CITY", visibleStar: false, paddingOn: true),
                CustomDropDown(
                  items: ["Califonia"],
                  value: widget.city,
                  onChanged: (value) {
                    setState(() {
                      selectedCityValue = value;
                    });
                  },
                ),
                Label(text: "STATE", visibleStar: false, paddingOn: true),
                CustomDropDown(
                  items: ["Califonia"],
                  value: selectedStateValue,
                  onChanged: (value) {
                    setState(() {
                      selectedStateValue = value;
                    });
                  },
                ),
                Label(text: "ZIP CODE", visibleStar: false, paddingOn: true),
                CustomTextFeild(
                  hint: widget.zipcode,
                  initValue: widget.zipcode,
                  textInputType: TextInputType.number,
                  onSaved: (value) => custZipcode = value,
                ),
                const SizedBox(
                  height: 140,
                ),
              ],
            ),
          )),
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
