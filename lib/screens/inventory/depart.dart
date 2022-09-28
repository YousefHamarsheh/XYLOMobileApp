// ignore_for_file: must_be_immutable, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:xylo/compononts/action_panel.dart';
import 'package:xylo/screens/inventory/edit_depart.dart';
import 'package:xylo/screens/inventory/view_depat.dart';
import 'package:http/http.dart' as http;

import '../../compononts/delete_alert.dart';
import '../../compononts/option.dart';
import '../../config.dart';
import '../../model/depart_data.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Department extends StatelessWidget {
  Department({Key key}) : super(key: key);

  //List Data
  List<DepartItem> departItem = [
    // const DepartItem("assets/images/burger.png", "651816098", "Grocery",
    //     "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium option"),
    // const DepartItem("assets/images/burger.png", "651816098", "Sanwich",
    //     "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium option"),
    // const DepartItem("assets/images/burger.png", "651816098", "Soda",
    //     "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium option"),
  ];

  Future _getDepartData() async {
    const url = '5.161.97.142:9001';
    const api = 'prodcat';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var dep in jsonData) {
      departItem.add(DepartItem(
          dep['txtCode'].toString(),
          dep['txtNamea'].toString(),
          dep['printTo'].toString(),
          dep['txtNamee'].toString(),
          dep['priorityindex'].toString(),
          dep['txtParentCode'].toString(),
          dep['age'].toString(),
          // cust['txtAddresse'].toString(),
          "assets/images/burger.png",
          dep['color'].toString(),
          dep['taxCategory'].toString(),
          dep['addtopos'],
          dep['showinmob'],
          dep['ebt'],
          dep['smalllinemodifier'],
          dep['express']));
      // print(cust['txtName'] + " " + cust['txtCode'].toString() + "\n");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);
    return Padding(
      padding: const EdgeInsets.only(top: kPadding),
      child: SizedBox(
          height:
              screenHeight < 690 ? screenHeight * 0.50 : screenHeight * 0.57,
          child: FutureBuilder(
            future: _getDepartData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: departItem.length,
                    itemBuilder: (context, index) {
                      return buildCard(index, context);
                    });
              } else {
                return ListView();
              }
            },
          )),
    );
  }

  Container buildCard(int index, context) {
    var data = departItem[index];
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)
          ]),
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCardTitle(context, data),
              OptionButton(
                onPress: () => buildOptionPopup(context),
              ),
            ],
          ),
          Text(
            data.dep_name,
            style: TextStyle(
              color: textheadlinecolor,
              fontSize: ResponsiveFlutter.of(context)
                  .fontSize(screenHeight > 890 ? 1.5 : 1.7),
            ),
          ),
        ],
      ),
    );
  }

  void buildOptionPopup(context) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomActionPanel(
            name: "Department",
            text: "If Department Has Transactions\nDelete Not Allowed",
            editOnTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const EditDepart())));
            },
            viewOnTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const ViewDepart())));
            },
          );
        });
  }

  Row buildCardTitle(BuildContext context, DepartItem data) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            data.dep_image,
            height: 60.0,
            width: 60.0,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.dep_name,
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context)
                      .fontSize(screenHeight > 890 ? 2.3 : 2.5),
                  color: kPrymeryColor2,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              data.name_display_on_screen,
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context)
                      .fontSize(screenHeight > 890 ? 1.3 : 1.5),
                  color: textheadlinecolor),
            ),
          ],
        )
      ],
    );
  }
}
