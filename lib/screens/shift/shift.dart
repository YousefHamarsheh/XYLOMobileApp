// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xylo/actions/ShiftActions.dart';
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
  ShiftPage({Key? key}) : super(key: key);

  ShiftActions shiftActions = ShiftActions();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(titles: "Shifts"),
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
                  future: shiftActions.getShiftData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: shiftActions.shiftData.length,
                          itemBuilder: (context, index) {
                            return ShiftCard(
                              shiftData: shiftActions.shiftData[index],
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
