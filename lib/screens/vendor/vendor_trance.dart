// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:xylo/compononts/custom_appbar.dart';
import 'package:xylo/compononts/filtter_btn.dart';
import 'package:xylo/compononts/searchfeild.dart';
import 'package:xylo/compononts/sort_button.dart';
import 'package:xylo/compononts/trans_card.dart';
import 'package:xylo/config.dart';

import '../../compononts/side_menu.dart';
import '../../model/vendor_trance_data.dart';

class VendorTrance extends StatefulWidget {
  final String title, value;
  const VendorTrance({Key key, @required this.title, @required this.value})
      : super(key: key);
  @override
  State<VendorTrance> createState() => _VendorTranceState();
}

class _VendorTranceState extends State<VendorTrance> {
  TextEditingController textEditingControllerSearch = TextEditingController();

  List<VendorTran> vendorItem = [
    const VendorTran("22/01/2022", "65875246", "10.0"),
    const VendorTran("22/01/2022", "65875246", "10.0"),
    const VendorTran("22/01/2022", "65875246", "10.0"),
    const VendorTran("22/01/2022", "65875246", "10.0"),
    const VendorTran("22/01/2022", "65875246", "10.0"),
    const VendorTran("22/01/2022", "65875246", "10.0"),
    const VendorTran("22/01/2022", "65875246", "10.0"),
  ];

  Padding buildList() {
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight); //Get device height for grid responsive
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: SizedBox(
        height: screenHeight * 0.50,
        child: ListView.builder(
          itemCount: vendorItem.length,
          itemBuilder: (context, index) {
            return TransCard(
              date: vendorItem[index].date,
              number: vendorItem[index].number,
              amount: vendorItem[index].amount,
            );
          },
        ),
      ),
    );
  }

  Container buildVendorTitle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: kPadding),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 207, 206, 206),
              blurRadius: 3,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: 10,),
              Text(widget.title,
                  style: TextStyle(
                      color: kPrymeryColor2,
                      fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                      fontWeight: FontWeight.bold)),
              Text(widget.value,
                  style: TextStyle(
                      color: textheadlinecolor,
                      fontSize: ResponsiveFlutter.of(context).fontSize(1.7),
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(titles: "Vendors"),
      //bottomSheet: closebtn(),

      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildVendorTitle(),
              Row(
                children: [
                  SearchFeild(
                      controller: null,
                      width: MediaQuery.of(context).size.width * 0.6,
                      hint: "Search by Document Number"),
                  FiltterButton(onPress: () {}),
                  SortButton(onPress: () {})
                ],
              ),
              buildList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 50,
          width: 100,
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(6)),
          child: Text(
            "CLOSE",
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveFlutter.of(context).fontSize(2.4)),
          ),
        ),
      ),
    );
  }
}
