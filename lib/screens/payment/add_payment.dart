// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom,_textfeild.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/custom_drpdown.dart';
import '../../compononts/side_menu.dart';
import '../../config.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({Key key}) : super(key: key);

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  // String selectedCityValue = "Califonia";
  // String selectedStateValue = "Califonia";

  String description = "description";
  String note = "note";
  final _keyForm = GlobalKey<FormState>();

  bool active = false, pay_out = false;

  Future<void> _savingData() async {
    final validation = _keyForm.currentState.validate();
    if (validation) {
      _keyForm.currentState.save();
    } else {
      return;
    }
  }

  Future
      _insertingPaymentData() async {} //Here the method that will save the payment data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: buildAppbar(),
      bottomSheet: BottomBar(addButtonAction: () => _insertingPaymentData()),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
              child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(text: "DESCRIPTION", paddingOn: true),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Desc...."),
                  onSaved: (value) {
                    description = value;
                  },
                ),
                Label(text: "Note", visibleStar: false, paddingOn: true),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Note..."),
                  onSaved: (value) {
                    note = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: active,
                        onChanged: (val) {
                          setState(() {
                            active = val;
                          });
                        }),
                    const Text(
                      "Active",
                      style: TextStyle(
                          color: textheadlinecolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Checkbox(
                        value: pay_out,
                        onChanged: (val) {
                          setState(() {
                            pay_out = val;
                          });
                        }),
                    const Text(
                      "Pay Out",
                      style: TextStyle(
                          color: textheadlinecolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
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
        "Add New Payment",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }
}
