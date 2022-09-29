// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom,_textfeild.dart';
import 'package:xylo/compononts/label.dart';
import 'package:http/http.dart' as http;
import 'package:xid/xid.dart';

import '../../compononts/custom_drpdown.dart';
import '../../compononts/side_menu.dart';
import '../../config.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key key}) : super(key: key);

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  //Variables for saving the inputs
  String name = "name";
  String email = "password";
  String phonenumber = "12345";
  String address = "address";
  // String city = "city";
  // String state = "state";
  String zipcode = "zip_code";
  final _keyForm = GlobalKey<FormState>();

  String selectedCityValue = "Califonia";
  String selectedStateValue = "Califonia";

  Future<void> _savingData() async {
    final validation = _keyForm.currentState.validate();
    if (validation) {
      _keyForm.currentState.save();
    } else {
      return;
    }
  }

  Future insertingData() async {
    _savingData();
    const url = "5.161.97.142:9001";
    const api = 'cust/save';
    var xid = Xid();
    final response = await http.post(Uri.http(url, api),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({
          "txtCode": xid.toString(),
          "numSeq": 37,
          "bolAllowglacctransaction": 0,
          "bolLegalcase": 0,
          "datBanklgenddate": null,
          "datBanklgstartdate": null,
          "datBirthdate": null,
          "datCreationdate": null,
          "dblBanklgamt": 0.0,
          "dblCustpoints": null,
          "dblDiscountrate": 0.0,
          "dblInitcustpoints": 0.0,
          "dblLattercreditamount": 0.0,
          "dblMaxcreditamt": 0.0,
          "dblMaxcreditday": 0.0,
          "dblMaxdebitamt": 0.0,
          "dblMaxuncollectchequeamt": 0.0,
          "dblUsedcustpoints": null,
          "intCsstatus": 0,
          "intIslocal": 0,
          "intMaxnouncollectcheque": 0,
          "intRowid": 0,
          "intStatus": null,
          "intType": 0,
          "txtAcccode": null,
          "txtAddress": address,
          "txtAdvertisercode": null,
          "txtAreacode": zipcode,
          "txtCardno": null,
          "txtCategorycode": null,
          "txtCelltel": null,
          "txtCitya": selectedCityValue,
          "txtCollectorcode": null,
          "txtComment": null,
          "txtCountrya": selectedStateValue,
          "txtCreditapplications": null,
          "txtEmail": email,
          "txtFax": null,
          "txtGroup": null,
          "txtManagera": null,
          "txtName": name,
          "txtPassportcopy": null,
          "txtRank": null,
          "txtRefercode": null,
          "txtSalesmancode": null,
          "txtTel1": phonenumber,
          "txtTel2": null,
          "txtTitle": null,
          "txtUrl": null,
          "txtVatno": null
        }));
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: buildAppbar(),
      bottomSheet: BottomBar(addButtonAction: () => insertingData()),
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
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Name"),
                    onSaved: (value) {
                      name = value;
                    },
                  ),
                  Label(text: "PHONE NUMBER", paddingOn: true),
                  // CustomTextFeild(
                  //   hint: "12345678920",
                  //   textInputType: TextInputType.phone,
                  // ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "12345678920"),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      phonenumber = value;
                    },
                  ),
                  Label(text: "Email", visibleStar: false, paddingOn: true),
                  // CustomTextFeild(
                  //   hint: "a.sayed@Xylo.lnc",
                  //   textInputType: TextInputType.emailAddress,
                  // ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: "a.sayed@Xylo.lnc"),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      email = value;
                    },
                  ),
                  Label(text: "ADDRESS", visibleStar: false, paddingOn: true),
                  // CustomTextFeild(
                  //   hint: "a.sayed@Xylo.lnc",
                  //   textInputType: TextInputType.streetAddress,
                  //   maxLLine: 4,
                  // ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: "a.sayed@Xylo.lnc"),
                    keyboardType: TextInputType.streetAddress,
                    onSaved: (value) {
                      address = value;
                    },
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
                  // CustomTextFeild(
                  //   hint: "12345263",
                  //   textInputType: TextInputType.number,
                  // ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "12345263"),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      zipcode = value;
                    },
                  ),
                  const SizedBox(
                    height: 140,
                  ),
                ],
              ),
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
        "Add New Customer",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }
}
