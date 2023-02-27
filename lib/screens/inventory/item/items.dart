// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xylo/compononts/action_panel.dart';
import 'package:xylo/screens/inventory/item/component/item_card.dart';
import 'package:xylo/screens/inventory/item/edit_item.dart';
import 'package:xylo/screens/inventory/item/item_inbox.dart';
import '../../../compononts/delete_alert.dart';
import '../../../actions/ItemActions.dart';
import '../../../config.dart';
import 'package:http/http.dart' as http;

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../model/item_data.dart';
import 'view_item.dart';

class ItemPage extends StatelessWidget {
  ItemPage({Key key}) : super(key: key);

  ItemActions itemActions = ItemActions();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: kPadding),
      child: SizedBox(
          height:
              screenHeight < 690 ? screenHeight * 0.50 : screenHeight * 0.58,
          child: FutureBuilder(
            future: itemActions.getItemsData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: itemActions.itemData.length,
                    itemBuilder: (context, index) {
                      return ItemCard(
                        itemData: itemActions.itemData[index],
                        optionOnTap: () => buildOptionPopup(
                            context, itemActions.itemData[index]),
                        screenHeight: screenHeight,
                        optionButton: true,
                      );
                    });
              } else {
                return ListView();
              }
            },
          )),
    );
  }

  void buildOptionPopup(BuildContext context, ItemData itemData) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomActionPanel(
            viewOnTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const ViewItem())));
            },
            editOnTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const EditItem())));
            },
            boxOnTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => ItemInBox(itemData: itemData))));
            },
            name: 'Item',
            text: 'If Item Has Transactions\nDelete Not Allowed',
          );
        });
  }

  void showDeleteDailog(String name, String text, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDelete(name: name, id: text);
        });
  }
}
