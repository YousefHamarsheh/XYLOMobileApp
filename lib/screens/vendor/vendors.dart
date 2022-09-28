// ignore_for_file: camel_case_types, deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:xylo/compononts/action_panel.dart';
import 'package:xylo/compononts/bottombar.dart';
import 'package:xylo/compononts/custom_appbar.dart';
import 'package:xylo/compononts/custom_card.dart';
import 'package:xylo/compononts/delete_alert.dart';
import 'package:xylo/compononts/option.dart';
import 'package:xylo/screens/vendor/edit_vendor.dart';
import 'package:xylo/screens/vendor/vendor_trance.dart';
import 'package:xylo/screens/vendor/view_vendor.dart';
import 'package:http/http.dart' as http;

import '../../compononts/filtter_btn.dart';
import '../../compononts/searchfeild.dart';
import '../../compononts/side_menu.dart';
import '../../compononts/sort_button.dart';
import '../../config.dart';
import '../../model/vendors_data.dart';
import 'add_vendor.dart';

class Vender extends StatefulWidget {
  const Vender({Key key}) : super(key: key);

  @override
  State<Vender> createState() => _VendorState();
}

class _VendorState extends State<Vender> {
  TextEditingController textEditingControllerSearch = TextEditingController();
  TextEditingController textEditingControllerForm = TextEditingController();
  TextEditingController textEditingControllerTo = TextEditingController();
  TextEditingController textEditingControllerAmount = TextEditingController();

  List<VendorItem> vendorItem = [];

  Future _getVendorData() async {
    const url = '5.161.97.142:9001';
    const api = 'cust';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var ven in jsonData) {
      vendorItem.add(VendorItem(
          ven['txtCscode'].toString(),
          ven['txtNamea'].toString(),
          ven['txtNamee'].toString(),
          ven['txtTel1'].toString(),
          ven['txtEmail'].toString(),
          ven['txtAddressa'].toString(),
          ven['txtCitya'].toString(),
          ven['txtAddresse'].toString(),
          ven['txtAreacode'].toString()));
      // print(cust['txtName'] + " " + cust['txtCode'].toString() + "\n");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(
          titles: "Vendors",
          plusButtonPress: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddVendor()));
          }),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SearchFeild(
                      hint: "Search by name, phone,ID",
                      width: ((MediaQuery.of(context).size.width) * 0.6),
                      controller: textEditingControllerSearch),
                  FiltterButton(onPress: () => filterPopup(context)),
                  SortButton(onPress: () => sortPopup(context)),
                ],
              ),
              buildList()
            ],
          ),
        ),
      ),
    );
  }

  void filterPopup(context) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Text("Apply Filters",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(3),
                          fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Text(
                    "Date",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                        color: Colors.grey),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildTextFeild(
                        "Form", ((MediaQuery.of(context).size.width) - 70) / 2),
                    buildTextFeild(
                        "To", ((MediaQuery.of(context).size.width) - 70) / 2),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Text(
                    "Amount",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                        color: Colors.grey),
                  ),
                ),
                buildTextAmoubtFeild("Amount", double.maxFinite),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildCancelbtn(context),
                      const SizedBox(
                        width: 20,
                      ),
                      buildAddbtn(context, () {}, false),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void sortPopup(context) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Text("Sort By",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(3),
                          fontWeight: FontWeight.w500)),
                ),
                const SizedBox(
                  height: 15,
                ),
                buildRadionButton(),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCancelbtn(context),
                    const SizedBox(
                      width: 20,
                    ),
                    buildAddbtn(context, () {}, false),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget buildRadionButton() {
    return RadioListTile(
        title: Text(
          "Last Added",
          style: TextStyle(
            color: Colors.grey,
            fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
            fontWeight: FontWeight.w400,
          ),
        ),
        value: 1,
        groupValue: 1,
        onChanged: (value) {
          setState(() {});
        });
  }

  Widget buildTextAmoubtFeild(String hint, double width) {
    return SizedBox(
      width: width,
      height: 50,
      child: TextFormField(
        controller: textEditingControllerAmount,
        style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(2.2)),
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black26),
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black26),
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black26),
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
            )),
      ),
    );
  }

  Widget buildTextFeild(String hint, double width) {
    return InkWell(
      onTap: () async {
        final DateTime picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2015, 8),
            lastDate: DateTime(2101));
        if (picked != null) {
          setState(() {
            hint == "Form"
                ? textEditingControllerForm.text =
                    "${picked.day} - ${picked.month} - ${picked.year}"
                : textEditingControllerTo.text =
                    "${picked.day} - ${picked.month} - ${picked.year}";
          });
        }
      },
      child: SizedBox(
        width: width,
        height: 50,
        child: TextFormField(
          controller: hint == "Form"
              ? textEditingControllerForm
              : textEditingControllerTo,
          style:
              TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(2.2)),
          enabled: false,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black26),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.0),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black26),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.0),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black26),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.0),
                ),
              )),
        ),
      ),
    );
  }

  Padding buildList() {
    double screenHeight = MediaQuery.of(context)
        .size
        .height; //Get device height for grid responsive
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: SizedBox(
          height: screenHeight * 0.66,
          child: FutureBuilder(
            future: _getVendorData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: vendorItem.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      text: vendorItem[index].vendor_name,
                      value: vendorItem[index].phonenumber,
                      option: () => buildOptionPopup(
                          context,
                          vendorItem[index].vendor_name,
                          vendorItem[index].phonenumber),
                    );
                  },
                );
              } else {
                return ListView();
              }
            },
          )),
    );
  }

  void buildOptionPopup(context, String text, String value) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomActionPanel(
            viewOnTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewVendor(),
                ),
              ),
            },
            editOnTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditVendor(),
                ),
              ),
            },
            tranceactionOnTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VendorTrance(
                    title: text,
                    value: value,
                  ),
                ),
              ),
            },
            name: 'Vendor',
            text: 'If Vendor Has Transactions\nDelete Not Allowed',
          );
        });
  }
}
