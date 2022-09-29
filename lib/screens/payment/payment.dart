// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xylo/actions/PaymentActions.dart';
import 'package:xylo/model/shift_data.dart';
import 'package:xylo/screens/payment/add_payment.dart';
import 'package:http/http.dart' as http;

import '../../compononts/custom_appbar.dart';
import '../../compononts/filtter_btn.dart';
import '../../compononts/searchfeild.dart';
import '../../compononts/side_menu.dart';
import '../../compononts/sort_button.dart';
import '../../config.dart';
import '../../model/payment_data.dart';
import 'compononts/paymentCard.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({Key key}) : super(key: key);

  PaymentActions paymentActions = PaymentActions();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(
          titles: "Payment Types",
          plusButtonPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddPayment(),
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
                  future: paymentActions.getPaymentData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: paymentActions.paymentData.length,
                          itemBuilder: (context, index) {
                            return PaymentCard(
                              paymentData: paymentActions.paymentData[index],
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
