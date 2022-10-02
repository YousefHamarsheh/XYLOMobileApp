// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:xylo/actions/VendorActions.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/custom_textfeild.dart';
import '../../compononts/custom_drpdown.dart';
import '../../compononts/side_menu.dart';
import '../../config.dart';

class AddVendor extends StatefulWidget {
  const AddVendor({Key key}) : super(key: key);

  @override
  State<AddVendor> createState() => _AddVendorState();
}

class _AddVendorState extends State<AddVendor> {
  VendorActions vendorActions = VendorActions();

  String selectedCityValue = "Califonia";
  String selectedStateValue = "Califonia";
  String name = "name";
  String contactName = "contactName";
  String phonenumber = "phonenumber";
  String email = "email";
  String address = "address";
  String zipcode = "zipcode";

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
          addButtonAction: () => _savingData().then((value) =>
              vendorActions.insertingVendorData(
                  name,
                  contactName,
                  phonenumber,
                  email,
                  address,
                  selectedCityValue,
                  selectedStateValue,
                  zipcode))),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
            child: Form(
          key: _keyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Label(text: "VENDOR NAME"),
              CustomTextFeild(
                hint: "Name",
                onSaved: (value) => name = value,
              ),
              Label(text: "CONTACT NAME"),
              CustomTextFeild(
                hint: "Name",
                onSaved: (value) => contactName = value,
              ),
              Label(text: "PHONE NUMBER"),
              CustomTextFeild(
                hint: "12345",
                textInputType: TextInputType.number,
                onSaved: (value) => phonenumber = value,
              ),
              Label(text: "EMAIL", visibleStar: false),
              CustomTextFeild(
                hint: "a.sayed@Xylo.lnc",
                textInputType: TextInputType.emailAddress,
                onSaved: (value) => email = value,
              ),
              Label(text: "ADDRESS", visibleStar: false),
              CustomTextFeild(
                hint: "a.sayed@Xylo.lnc",
                textInputType: TextInputType.streetAddress,
                maxLLine: 4,
                onSaved: (value) => address = value,
              ),
              Label(text: "CITY", visibleStar: false),
              const SizedBox(height: 5),
              CustomDropDown(
                items: const ["Califonia"],
                value: selectedCityValue,
                onChanged: (value) {
                  setState(() {
                    selectedCityValue = value;
                  });
                },
              ),
              Label(text: "STATE", visibleStar: false),
              CustomDropDown(
                items: const ["Califonia"],
                value: selectedStateValue,
                onChanged: (value) {
                  setState(() {
                    selectedStateValue = value;
                  });
                },
              ),
              Label(text: "ZIP CODE", visibleStar: false),
              CustomTextFeild(
                hint: "0000",
                textInputType: TextInputType.number,
                onSaved: (value) => zipcode = value,
              ),
              const SizedBox(
                height: 120,
              ),
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
        "Add New Vendor",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }
}
