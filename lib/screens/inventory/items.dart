// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xylo/compononts/action_panel.dart';
import 'package:xylo/screens/inventory/comporents/item_card.dart';
import 'package:xylo/screens/inventory/edit_item.dart';
import 'package:xylo/screens/inventory/item_inbox.dart';
import '../../compononts/delete_alert.dart';
import '../../config.dart';
import 'package:http/http.dart' as http;

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../model/item_data.dart';
import 'view_item.dart';

class ItemPage extends StatelessWidget {
  ItemPage({Key key}) : super(key: key);

  List<ItemData> itemData = [
    // const ItemData("assets/images/burger.png", "651816098", "Bag", "Grocery",
    //     "1257896", "1458"),
    // const ItemData("assets/images/burger.png", "651816098", "Bag", "Grocery",
    //     "1257896", "1458"),
    // const ItemData("assets/images/burger.png", "651816098", "Bag", "Grocery",
    //     "1257896", "1458"),
    // const ItemData("assets/images/burger.png", "651816098", "Bag", "Grocery",
    //     "1257896", "1458"),
  ];

  Future _getItemsData() async {
    const url = '5.161.97.142:9001';
    const api = 'products';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var item in jsonData) {
      var active = false;
      if (item['bolActive'] == 1) {
        active = true;
      }
      itemData.add(ItemData(
        "assets/images/burger.png",
        item['txtCode'],
        active,
        item['bolBatchable'],
        item['bolDonotprintprice'],
        item['bolItemizable'],
        item['bolLocal'],
        item['bolPriceincludevat'],
        item['dblCostprice'],
        item['dblCurrentqty'],
        item['dblDefaultvatrate'],
        item['dblEqv'],
        item['dblSellprice'],
        item['dblSellprice2'],
        item['dblSellprice3'],
        item['dblSellprice4'],
        item['intProducttype'],
        item['intQuantitycontrols'],
        item['txtBarcode'],
        ProductcatTbl(
            item['productcatTbl']['txtCode'],
            item['productcatTbl']['bolAllowdiscount'],
            item['productcatTbl']['datCreationdate'],
            item['productcatTbl']['intDeleted'],
            item['productcatTbl']['txtNamea'],
            item['productcatTbl']['txtNamee'],
            item['productcatTbl']['txtPrintername'],
            item['productcatTbl']['txtUsercode'],
            item['productcatTbl']['numIsParent'],
            item['productcatTbl']['txtParentCode'],
            item['productcatTbl']['printTo'],
            item['productcatTbl']['taxCategory'],
            item['productcatTbl']['smalllinemodifier'],
            item['productcatTbl']['addtopos'],
            item['productcatTbl']['showinmob'],
            item['productcatTbl']['color'],
            item['productcatTbl']['priorityindex'],
            item['productcatTbl']['age'],
            item['productcatTbl']['express'],
            item['productcatTbl']['ebt']),
        item['txtGroupreference'],
        item['txtName'],
        item['txtNotes'],
        item['txtRetsalesacccode'],
        item['txtSalesacccode'],
        item['txtStkprodno'],
        item['txtSupcode1'],
        item['txtSupcode2'],
        item['txtSupcode3'],
        item['txtUnit'],
        item['adult'],
        item['ebt'],
        item['byWeight'],
        item['itemSize'],
        item['feeMultiplier'],
        item['addToPos'],
        item['color'],
        item['taxCat'],
        item['priorityIndex'],
        item['smallLineModifier'],
        item['showinMob'],
        item['trackable'],
        item['shipping'],
        item['printTo'],
        item['express'],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: kPadding),
      child: SizedBox(
          height:
              screenHeight < 690 ? screenHeight * 0.50 : screenHeight * 0.58,
          child: FutureBuilder(
            future: _getItemsData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: itemData.length,
                    itemBuilder: (context, index) {
                      return ItemCard(
                        itemData: itemData[index],
                        optionOnTap: () =>
                            buildOptionPopup(context, itemData[index]),
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
