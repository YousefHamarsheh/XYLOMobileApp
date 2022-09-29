// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:xylo/actions/CategActions.dart';
import 'package:xylo/screens/category/add_cat.dart';
import 'package:xylo/screens/category/compononts/categoryCard.dart';
import 'package:http/http.dart' as http;

import '../../compononts/action_panel.dart';
import '../../compononts/custom_appbar.dart';
import '../../compononts/filtter_btn.dart';
import '../../compononts/searchfeild.dart';
import '../../compononts/side_menu.dart';
import '../../compononts/sort_button.dart';
import '../../config.dart';
import '../../model/category_data .dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key key}) : super(key: key);

  CategActions categActions = CategActions();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(
          titles: "Tax Category",
          plusButtonPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddCategory(),
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
                  future: categActions.getTaxCatData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: categActions.categoryData.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              categoryData: categActions.categoryData[index],
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
            name: 'Tax Category',
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
