// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:xylo/actions/UserActions.dart';
import 'package:xylo/compononts/action_panel.dart';
import 'package:xylo/compononts/custom_appbar.dart';
import 'package:xylo/compononts/searchfeild.dart';
import 'package:xylo/screens/user/edit_user.dart';
import 'package:xylo/screens/user/view_user.dart';
import 'package:http/http.dart' as http;

import '../../compononts/custom_card.dart';
import '../../compononts/filtter_btn.dart';
import '../../compononts/option.dart';
import '../../compononts/side_menu.dart';
import '../../compononts/sort_button.dart';
import '../../config.dart';

import '../../model/user_data.dart';
import 'add_user.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController textEditingControllerSearch = TextEditingController();

  UserActions userActions = UserActions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(
          titles: "User",
          plusButtonPress: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddUser()));
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SearchFeild(
                      controller: null,
                      width: ((MediaQuery.of(context).size.width) - 160),
                      hint: "Search by name, phone,ID"),
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

  Padding buildList() {
    double screenHeight = MediaQuery.of(context)
        .size
        .height; //Get device height for grid responsive
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: SizedBox(
          height: screenHeight * 0.75,
          child: FutureBuilder(
            future: userActions.getUsersData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // print("object");
                return ListView.builder(
                  itemCount: userActions.userItem.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      text: userActions.userItem[index].txtName,
                      value: userActions.userItem[index].txtPhone.toString(),
                      option: () => buildOptionPopup(context),
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

  void buildOptionPopup(context) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomActionPanel(
            name: 'User',
            viewOnTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewUser(),
                ),
              ),
            },
            tranceactionOnTap: () {},
            editOnTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditUser(),
                ),
              ),
            },
          );
        });
  }
}
