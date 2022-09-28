// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:xylo/compononts/custom_appbar.dart';
import 'package:xylo/compononts/searchfeild.dart';
import 'package:xylo/screens/deal/add_deal.dart';
import 'package:xylo/screens/deal/deal_card.dart';
import 'package:http/http.dart' as http;

import '../../compononts/action_panel.dart';
import '../../compononts/bottombar.dart';
import '../../compononts/filtter_btn.dart';
import '../../compononts/side_menu.dart';
import '../../compononts/sort_button.dart';
import '../../config.dart';
import '../../model/deals_data.dart';

class Deals extends StatefulWidget {
  const Deals({Key key}) : super(key: key);

  @override
  State<Deals> createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  TextEditingController textEditingControllerSearch = TextEditingController();
  TextEditingController textEditingControllerForm = TextEditingController();
  TextEditingController textEditingControllerTo = TextEditingController();

  List<DealsData> dashboardItem = [
    // const DealsData("Name", "Super Marcket", "2022-05-17", "2022-07-14"),
    // const DealsData("Name", "Super Marcket", "2022-05-17", "2022-07-14"),
    // const DealsData("Name", "Super Marcket", "2022-05-17", "2022-07-14"),
  ];
  Future _getDealsData() async {
    const url = '5.161.97.142:9001';
    const api = 'discountrules';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var pay in jsonData) {
      bool active = false;
      if (pay['bolActive'] == 1) {
        active = true;
      }
      dashboardItem.add(DealsData(
          pay['txtCode'],
          active,
          pay['bolOnlyformanager'],
          pay['datFromdate'],
          pay['datTodate'],
          pay['dateCreationdate'],
          pay['dblDefaultdiscountvalue'],
          pay['dblMaxdiscountpermanager'],
          pay['dblMaxdiscountperuser'],
          pay['intDeleted'],
          pay['txtName'],
          pay['txtRelatedacccode']));
    }
  }

  Padding buildList() {
    double screenHeight = MediaQuery.of(context)
        .size
        .height; //Get device height for grid responsive
    return Padding(
        padding: const EdgeInsets.only(top: 36),
        child: SizedBox(
            height: screenHeight * 0.68,
            child: FutureBuilder(
              future: _getDealsData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      itemCount: dashboardItem.length,
                      itemBuilder: (context, index) {
                        return DealCard(
                          dealData: dashboardItem[index],
                          optionOnTap: () => buildOptionPopup(context),
                          screenHeight: screenHeight,
                          optionButton: true,
                        );
                      });
                } else {
                  return ListView();
                }
              },
            )));
  }

  Container buildCard(String image) {
    double width = ((MediaQuery.of(context).size.width) - 48) /
        2; //Get device width for card size
    return Container(
      width: width,
      height: 120,
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(
        titles: "Deals",
        plusButtonPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddDeal(),
            ),
          );
        },
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SearchFeild(
                        hint: "Search",
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
          enabled: false,
          style:
              TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(2.2)),
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

  void buildOptionPopup(BuildContext context) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return const BottomActionPanel(
            name: 'Deal',
            text: 'If Delete Has Transactions\nDelete Not Allowed',
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
}
