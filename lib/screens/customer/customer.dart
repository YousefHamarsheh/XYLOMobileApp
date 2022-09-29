// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:xylo/compononts/action_panel.dart';
import 'package:xylo/compononts/custom_appbar.dart';
import 'package:xylo/compononts/custom_card.dart';
import 'package:xylo/compononts/filtter_btn.dart';
import 'package:xylo/compononts/searchfeild.dart';
import 'package:xylo/compononts/sort_button.dart';
import 'package:xylo/screens/customer/add_customer.dart';
import 'package:xylo/screens/customer/edit_customer%20.dart';
import 'package:xylo/screens/customer/view_customer.dart';
import 'package:http/http.dart' as http;

import '../../compononts/delete_alert.dart';
import 'customer_trance.dart';
import '../../compononts/option.dart';
import '../../compononts/side_menu.dart';
import '../../config.dart';
import '../../model/customer_data.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   getCustomerData();
  // }

  TextEditingController textEditingControllerSearch = TextEditingController();
  List<CustomerItem> customerItem = [];
  Future _getCustomerData() async {
    const url = '5.161.97.142:9001';
    const api = 'cust';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var cust in jsonData) {
      customerItem.add(CustomerItem(
          cust['txtCode'].toString(),
          cust['txtName'].toString(),
          cust['txtTel1'].toString(),
          cust['txtEmail'].toString(),
          cust['txtAddress'].toString(),
          cust['txtCitya'].toString(),
          cust['txtAddress'].toString(),
          cust['txtAreacode'].toString()));
      // print(cust['txtName'] + " " + cust['txtCode'].toString() + "\n");
    }
  }

  Padding buildList() {
    double screenHeight = MediaQuery.of(context)
        .size
        .height; //Get device height for grid responsive
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: SizedBox(
          height: screenHeight * 0.75,
          child: FutureBuilder(
            future: _getCustomerData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: customerItem.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      text: customerItem[index].name,
                      value: customerItem[index].phonenumber,
                      option: () => buildOptionPopup(
                          context,
                          customerItem[index].name,
                          customerItem[index].phonenumber,
                          customerItem[index].id),
                    );
                  },
                );
              } else {
                return ListView();
              }
            },
          )),
    );
  }

  void buildOptionPopup(context, String name, String phonenumber, String id) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomActionPanel(
            viewOnTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewCustomer(),
                ),
              ),
            },
            editOnTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditCustomer(),
                ),
              ),
            },
            tranceactionOnTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerTrance(
                    title: name,
                    value: phonenumber,
                  ),
                ),
              ),
            },
            deleteOnTap: () {
              Navigator.pop(context);
              showDeleteDailog(name, id);
            },
            name: name,
            text: 'If Customer Has Transactions\nDelete Not Allowed',
          );
        });
  }

  void showDeleteDailog(String name, String id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDelete(name: name, id: id);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(
          titles: "Customer",
          plusButtonPress: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => const AddCustomer())));
          }),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SearchFeild(
                      hint: "Search by name, phone,ID",
                      width: ((MediaQuery.of(context).size.width) - 160),
                      controller: textEditingControllerSearch),
                  FiltterButton(onPress: () {}),
                  SortButton(onPress: () {}),
                ],
              ),
              buildList()
            ],
          ),
        ),
      ),
    );
  }
}