import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:xylo/compononts/custom_appbar.dart';

import '../compononts/searchfeild.dart';
import '../compononts/side_menu.dart';
import '../config.dart';
import '../model/dashbord_data.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController textEditingControllerSearch = TextEditingController();
  //Sample Data
  List<DashBoardItem> dashboardItem = [
    DashBoardItem("assets/images/label.png", "Sales", "55,500,000\$"),
    DashBoardItem("assets/images/deal.png", "Deals", "150"),
    DashBoardItem("assets/images/vendor.png", "Vendors", "750"),
    DashBoardItem("assets/images/customers.png", "Customers", "150"),
    DashBoardItem("assets/images/users.png", "Users", "55000"),
    DashBoardItem("assets/images/label.png", "Items", "250,000"),
    DashBoardItem("assets/images/label.png", "Balance", "55,500,000\$"),
    DashBoardItem("assets/images/label.png", "Bills", "150,000"),
    DashBoardItem("assets/images/reports.png", "Reports", "55023"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: CustomAppBar(titles: "Dashboard"),
      body: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchFeild(
                    controller: textEditingControllerSearch,
                    width: double.maxFinite,
                    hint: "Search"),
                buildGrid()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildGrid() {
    double screenHeight = MediaQuery.of(context)
        .size
        .height; //Get device height for grid responsive
    return Padding(
      padding: const EdgeInsets.only(top: 36),
      child: SizedBox(
        height: screenHeight * 0.68,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 24, mainAxisSpacing: 36),
          itemCount: dashboardItem.length,
          itemBuilder: (context, index) {
            return buildCard(dashboardItem[index].imagePath,
                dashboardItem[index].title, dashboardItem[index].value);
          },
        ),
      ),
    );
  }

  Container buildCard(String image, String text, String value) {
    double width = ((MediaQuery.of(context).size.width) - 48) /
        2; //Get device width for card size
    return Container(
      width: width,
      height: width,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 207, 206, 206),
              blurRadius: 3,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Image.asset(
              image,
              width: 50,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(text,
                style: TextStyle(
                    color: const Color(0xff1fa5cf),
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.8),
                    fontWeight: FontWeight.bold)),
          ),
          Text(value,
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
