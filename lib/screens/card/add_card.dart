// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:xylo/actions/CardActions.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom_textfeild.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/side_menu.dart';
import '../../config.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String selectedCityValue = "Califonia";
  String selectedStateValue = "Califonia";
  String ref = "ref";
  String description = "description";
  double comPercent = 0.0;
  bool merch_afford = false;
  CardActions cardActions = CardActions();
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
          addButtonAction: () => _savingData().then((value) => cardActions
              .insertCardData(ref, description, comPercent, merch_afford))),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
              child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(text: "REFFERENCE", paddingOn: true),
                CustomTextFeild(
                  hint: "Ref",
                  onSaved: (value) => ref = value,
                ),
                Label(text: "DESCRIPTION", paddingOn: true),
                CustomTextFeild(
                  hint: "Desc...",
                  onSaved: (value) => description = value,
                ),
                Label(text: "Commision Percentage", paddingOn: true),
                CustomTextFeild(
                  hint: "0.3",
                  textInputType: TextInputType.number,
                  onSaved: (value) => comPercent = value,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: merch_afford,
                        onChanged: (val) {
                          setState(() {
                            merch_afford = val;
                          });
                        }),
                    const Text(
                      "Merchant Afford",
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
        "Add New Credit Card",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }
}
