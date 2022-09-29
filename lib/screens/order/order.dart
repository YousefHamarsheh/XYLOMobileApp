// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:xylo/actions/OrderActions.dart';
import 'package:xylo/screens/order/add_order.dart';
import 'package:http/http.dart' as http;
import '../../compononts/action_panel.dart';
import '../../compononts/custom_appbar.dart';
import '../../compononts/filtter_btn.dart';
import '../../compononts/searchfeild.dart';
import '../../compononts/side_menu.dart';
import '../../compononts/sort_button.dart';
import '../../config.dart';
import '../../model/order_data.dart';
import 'compononts/orderCard.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key key}) : super(key: key);

  OrderActions orderActions = OrderActions();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(
          titles: "Orders Type",
          plusButtonPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddOrder(),
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
                  future: orderActions.getOrderData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: orderActions.orderData.length,
                          itemBuilder: (context, index) {
                            return OrderCard(
                              orderData: orderActions.orderData[index],
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
            name: 'Order',
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
