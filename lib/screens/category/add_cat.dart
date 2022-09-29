// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xylo/actions/CategActions.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom,_textfeild.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/side_menu.dart';
import '../../config.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key key}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  // String selectedCityValue = "Califonia";
  // String selectedStateValue = "Califonia";

  CategActions categActions = CategActions();

  String code = "code";
  String name = "name";
  double categValue = 0;
  bool percent = false;
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
          addButtonAction: () => _savingData().then((value) => categActions
              .insertingCategoryData(code, name, categValue, percent))),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(text: "CODE", paddingOn: true),
                TextFormField(
                  decoration: const InputDecoration(hintText: "002"),
                  onSaved: (value) {
                    code = value;
                  },
                ),
                Label(text: "NAME", paddingOn: true),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Name"),
                  onSaved: (value) {
                    name = value;
                  },
                ),
                Label(text: "VALUE", paddingOn: true),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Value"),
                  keyboardType: TextInputType.number,
                  onSaved: (value1) {
                    categValue = double.parse(value1);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: percent,
                        onChanged: (val) {
                          setState(() {
                            percent = val;
                          });
                        }),
                    const Text(
                      "Percentage",
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
        "Add New Tax Category",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }
}
