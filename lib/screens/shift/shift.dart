// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xylo/model/shift_data.dart';
import 'package:xylo/screens/shift/compononts/shiftCard.dart';
import 'package:http/http.dart' as http;

import '../../compononts/custom_appbar.dart';
import '../../compononts/filtter_btn.dart';
import '../../compononts/searchfeild.dart';
import '../../compononts/side_menu.dart';
import '../../compononts/sort_button.dart';
import '../../config.dart';

class ShiftPage extends StatelessWidget {
  ShiftPage({Key key}) : super(key: key);

  List<ShiftData> shiftData = [];

  Future _getShiftData() async {
    const url = '5.161.97.142:9001';
    const api = 'cashopenclose';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var shift in jsonData) {
      var status = "Closed";
      if (shift['intStatus'] == 1) {
        status = "Opened";
      }
      shiftData.add(ShiftData(
          shift['txtKey'],
          shift['datClosedate'],
          shift['datCreationdate'],
          shift['datOpendate'],
          shift['dblLeftamount'],
          shift['dblRevolvils'],
          shift['dblRevolvjod'],
          shift['dblRevolvusa'],
          shift['intClosetype'],
          shift['intHoldstatus'],
          shift['intShiftcode'],
          status,
          shift['timClosetime'],
          shift['timOpentime'],
          shift['txtBranchcode'],
          shift['txtComments'],
          shift['txtIpaddress'],
          shift['txtUsercode'],
          shift['txtUsername']));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(titles: "Shifts", plusButtonPress: () {}),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(kPadding, 24, kPadding, kPadding),
        child: Column(
          children: [
            Row(
              children: [
                SearchFeild(controller: null, width: width, hint: "Search"),
                FiltterButton(onPress: () {}),
                SortButton(onPress: () {}),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
                height: screenHeight * 0.75,
                child: FutureBuilder(
                  future: _getShiftData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: shiftData.length,
                          itemBuilder: (context, index) {
                            return ShiftCard(
                              shiftData: shiftData[index],
                              optionOnTap: () => null,
                              screenHeight: screenHeight,
                              optionButton: true,
                            );
                          });
                    } else {
                      return ListView();
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }

  /*  void buildOptionPopup(BuildContext context, ShiftData ShiftData) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomActionPanel(
            viewOnTap:(){Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const ViewItem())));} ,
            editOnTap: (){Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const EditItem())));},
            boxOnTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => ItemInBox(ShiftData: ShiftData))));
            }, name: 'Item', text: 'If Item Has Transactions\nDelete Not Allowed',
          );
        });
  } */

  /* void showDeleteDailog(String name, String text, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDelete(name: name, text: text);
        });
  } */
}
