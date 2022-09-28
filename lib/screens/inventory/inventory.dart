// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:xylo/compononts/custom_appbar.dart';
import 'package:xylo/compononts/searchfeild.dart';

import '../../compononts/bottombar.dart';
import '../../compononts/filtter_btn.dart';
import '../../compononts/side_menu.dart';
import '../../compononts/sort_button.dart';
import '../../config.dart';
import 'add_depart.dart';
import 'add_item.dart';
import 'depart.dart';
import 'items.dart';
import 'report.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  bool isActive1 = false;
  bool isActive2 = false;
  bool isActiveRadio = false;

  int val = -1;

  int index = 0;
  TextEditingController textEditingControllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(
          titles: "Inventory",
          plusButtonPress: () {
            if (index == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddDEpart()));
            } else if (index == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddItem()));
            }
          }),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          children: [
            buidNavButtons(screenWidth),
            const SizedBox(
              height: kPadding * 2,
            ),
            Row(
              children: [
               SearchFeild(controller: null, width: ((MediaQuery.of(context).size.width) * 0.6), hint: "Search"),
                FiltterButton(onPress: () {
                  if (index == 0) {
                    filterpopup(context);
                  }
                }),
                SortButton(onPress: () {
                  if (index == 0) {
                    sortPopup(context);
                  }
                }),
              ],
            ),
            index == 0
                ? Department()
                : (index == 1 ? ItemPage() : const Report())
          ],
        ),
      ),
    );
  }



  void filterpopup(context) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.36,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Text("Apply Filters",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(3), fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  check1(),
                  check2(),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildCancelbtn(context),
                      const SizedBox(
                        width: 20,
                      ),
                      buildAddbtn(context, () {}, false),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget check1() {
    return CheckboxListTile(
      title:  Text(
        "Have Expired Items",
        style: TextStyle(
            fontSize: ResponsiveFlutter.of(context).fontSize(2.4), fontWeight: FontWeight.w500, color: Colors.grey),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: isActive1,
      onChanged: (bool newValue1) {
        setState(() {
          isActive1 = newValue1;
        });
      },
    );
  }

  Widget check2() {
    return CheckboxListTile(
      title:  Text(
        "Has No Items",
        style: TextStyle(
            fontSize: ResponsiveFlutter.of(context).fontSize(2.4), fontWeight: FontWeight.w500, color: Colors.grey),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: isActive2,
      onChanged: (bool newValue2) {},
    );
  }

  void sortPopup(context) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.36,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:const EdgeInsets.only(top: 20, left: 10),
                    child: Text("Sort By",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(3), fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  radio1(),
                  radio2(),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildCancelbtn(context),
                      const SizedBox(
                        width: 20,
                      ),
                      buildAddbtn(context, () {}, false),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget radio1() {
    return RadioListTile<bool>(
        title:  Text(
          "Last Added",
          style: TextStyle(
            color: Colors.grey,
            fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
            fontWeight: FontWeight.w400,
          ),
        ),
        value: !isActiveRadio,
        groupValue: isActiveRadio,
        onChanged: (bool value) {
          setState(() {
            isActiveRadio = value;
          });
        });
  }

  Widget radio2() {
    return RadioListTile(
        title: Text(
          "Last Modifide",
          style: TextStyle(
            color: Colors.grey,
            fontSize:  ResponsiveFlutter.of(context).fontSize(2.4),
            fontWeight: FontWeight.w400,
          ),
        ),
        value: isActiveRadio,
        groupValue: isActiveRadio,
        onChanged: (bool value) {
          setState(() {
            isActiveRadio = value;
          });
        });
  }

  Padding buidNavButtons(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: kPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildDprtButton(screenWidth - 35),
          buildItemButton(screenWidth - 35),
          buildReportButton(screenWidth - 35),
        ],
      ),
    );
  }

  InkWell buildDprtButton(double width) {
    return InkWell(
      onTap: () {
        setState(() {
          index = 0;
        });
      },
      child: SizedBox(
          width: width * 0.4,
          height: 50,
          child: Card(
            margin: const EdgeInsets.all(0),
            elevation: 0,
            color: index == 0 ? kPrymeryColor2 : Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                side: BorderSide(width: 1, color: kPrymeryColor2)),
            child: Center(
              child: Text(
                "Department",
                style: TextStyle(
                    color: index == 0 ? Colors.white : textheadlinecolor,
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.8)),
              ),
            ),
          )),
    );
  }

  InkWell buildItemButton(double width) {
    return InkWell(
      onTap: () {
        setState(() {
          index = 1;
        });
      },
      child: SizedBox(
        width: width * 0.3,
        height: 50,
        child: Card(
          margin: const EdgeInsets.all(0),
          elevation: 0,
          color: index == 1 ? kPrymeryColor2 : Colors.white,
          shape: const RoundedRectangleBorder(
              side: BorderSide(width: 1, color: kPrymeryColor2)),
          child: Center(
            child: Text(
              "Items",
              style: TextStyle(
                  color: index == 1 ? Colors.white : textheadlinecolor,
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.8)),
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildReportButton(double width) {
    return InkWell(
      onTap: () {
        setState(() {
          index = 2;
        });
      },
      child: SizedBox(
        width: width * 0.3,
        height: 50,
        child: Card(
          margin: const EdgeInsets.all(0),
          color: index == 2 ? kPrymeryColor2 : Colors.white,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10)),
              side: BorderSide(width: 1, color: kPrymeryColor2)),
          child: Center(
            child: Text(
              "Report",
              style: TextStyle(
                  color: index == 2 ? Colors.white : textheadlinecolor,
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.8)),
            ),
          ),
        ),
      ),
    );
  }
}
