// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xylo/actions/ClockActions.dart';
import '../../compononts/custom_appbar.dart';
import '../../compononts/filtter_btn.dart';
import '../../compononts/searchfeild.dart';
import '../../compononts/side_menu.dart';
import '../../compononts/sort_button.dart';
import '../../config.dart';
import '../../model/clock_data.dart';
import 'compononts/clockCard.dart';

class ClockPage extends StatelessWidget {
  ClockPage({Key key}) : super(key: key);

  ClockActions clockActions = ClockActions();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(titles: "Clocks", plusButtonPress: () {}),
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
                  future: clockActions.getClockData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: clockActions.clockData.length,
                          itemBuilder: (context, index) {
                            return ClockCard(
                              clockData: clockActions.clockData[index],
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
