import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:xylo/actions/CustActions.dart';
import 'package:xylo/compononts/custom_appbar.dart';
import 'package:xylo/compononts/filtter_btn.dart';
import 'package:xylo/compononts/searchfeild.dart';
import 'package:xylo/compononts/side_menu.dart';
import 'package:xylo/compononts/sort_button.dart';
import 'package:xylo/compononts/trans_card.dart';

import '../../config.dart';
import '../../model/transactions/Transaction.dart';

class CustomerTrance extends StatefulWidget {
  final String title, value, cust_id;
  const CustomerTrance(
      {Key key,
      @required this.title,
      @required this.value,
      @required this.cust_id})
      : super(key: key);

  @override
  State<CustomerTrance> createState() => _CustomerTranceState();
}

class _CustomerTranceState extends State<CustomerTrance> {
  TextEditingController textEditingControllerSearch = TextEditingController();

  CustActions custActions = CustActions();

  Padding buildList() {
    double screenHeight = MediaQuery.of(context)
        .size
        .height; //Get device height for grid responsive
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
      ),
      child: SizedBox(
          height: screenHeight * 0.66,
          child: FutureBuilder(
            future: custActions.getCustTransData(widget.cust_id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: custActions.dashboardItem.length,
                  itemBuilder: (context, index) {
                    return TransCard(
                      date: custActions.dashboardItem[index].datTransdate,
                      number: custActions.dashboardItem[index].txtWarehousecode,
                      amount: custActions.dashboardItem[index].txtCurrency,
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

  Container buildTopCard() {
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
              const SizedBox(
                height: 10,
              ),
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

  Widget closebtn() {
    double width = ((MediaQuery.of(context).size.width) - 100);
    return Center(
      child: SizedBox(
        width: width,
        height: 50,
        // ignore: deprecated_member_use
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
          child: Text(
            "CLOSE",
            style: TextStyle(
              color: Colors.grey,
              fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget bottom() {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(5.0)),
      ),
      child: closebtn(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(titles: "Customer"),
      bottomSheet: bottom(),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTopCard(),
              Row(
                children: [
                  SearchFeild(
                      controller: null,
                      width: ((MediaQuery.of(context).size.width) * 0.6),
                      hint: 'Search'),
                  const SizedBox(
                    width: 4,
                  ),
                  SortButton(onPress: () {}),
                  FiltterButton(onPress: () {})
                ],
              ),
              buildList(),
            ],
          ),
        ),
      ),
    );
  }
}
