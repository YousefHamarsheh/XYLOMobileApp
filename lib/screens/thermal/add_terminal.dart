// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:xylo/actions/TermActions.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom_textfeild.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/side_menu.dart';
import '../../config.dart';

class AddTerminal extends StatefulWidget {
  const AddTerminal({Key key}) : super(key: key);

  @override
  State<AddTerminal> createState() => _AddTerminalState();
}

class _AddTerminalState extends State<AddTerminal> {
  TermActions termActions = TermActions();

  String termKey = "key";
  String merch_id = "merch_id";
  String description = "description";
  bool active = false;
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
          addButtonAction: () => _savingData().then((value) => termActions
              .insertingTermData(termKey, merch_id, description, active))),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
              child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(text: "KEY", paddingOn: true),
                CustomTextFeild(
                  hint: "002",
                  onSaved: (value) => termKey = value,
                ),
                Label(text: "MERCHANT ID", paddingOn: true),
                CustomTextFeild(
                  hint: "Tax 002",
                  onSaved: (value) => merch_id = value,
                ),
                Label(text: "DESCRIPTION", paddingOn: true),
                CustomTextFeild(
                  hint: "Desc....",
                  onSaved: (value) => description = value,
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
        "Add New Terminal",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }
}
