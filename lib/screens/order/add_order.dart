// ignore_for_file: unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:xylo/actions/OrderActions.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom_textfeild.dart';
import 'package:xylo/compononts/label.dart';

import '../../compononts/side_menu.dart';
import '../../config.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({Key key}) : super(key: key);

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  OrderActions orderActions = OrderActions();
  String order_type_code = "order_type_code";
  String order_type_name = "order_type_name";
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
          addButtonAction: () => _savingData().then((value) => _savingData()
              .then((value) => orderActions.insertingOrderData(
                  order_type_code, order_type_name, active)))),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SafeArea(
          child: SingleChildScrollView(
              child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(text: "ORDER TYPE CODE", paddingOn: true),
                CustomTextFeild(
                  hint: "Type",
                  onSaved: (value) => order_type_code = value,
                ),
                Label(text: "ORDER TYPE NAME", paddingOn: true),
                CustomTextFeild(
                  hint: "Name",
                  onSaved: (value) => order_type_name = value,
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
        "Add New Order",
        style: TextStyle(color: textheadlinecolor),
      ),
      elevation: 0,
    );
  }
}
