// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:xylo/actions/TermActions.dart';
import 'package:xylo/screens/category/compononts/categoryCard.dart';
import 'package:xylo/screens/thermal/add_terminal.dart';
import 'package:http/http.dart' as http;

import '../../compononts/action_panel.dart';
import '../../compononts/custom_appbar.dart';
import '../../compononts/filtter_btn.dart';
import '../../compononts/searchfeild.dart';
import '../../compononts/side_menu.dart';
import '../../compononts/sort_button.dart';
import '../../config.dart';
import '../../model/thermal_data.dart';
import 'compononts/thermal.dart';

class ThermalPage extends StatelessWidget {
  ThermalPage({Key? key}) : super(key: key);

  TermActions termActions = TermActions();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(
          titles: "Terminal ID",
          plusButtonPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTerminal(),
              ),
            );
          }),
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
                  future: termActions.getTerminalData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: termActions.thermalData.length,
                          itemBuilder: (context, index) {
                            return ThermalCard(
                              thermalData: termActions.thermalData[index],
                              optionOnTap: () => buildOptionPopup(context),
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

  void buildOptionPopup(BuildContext context) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return const BottomActionPanel(
            name: 'Terminal ID',
            text: 'If Delete Has Transactions\nDelete Not Allowed',
          );
        });
  }

  /* void showDeleteDailog(String name, String text, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDelete(name: name, text: text);
        });
  } */
}
