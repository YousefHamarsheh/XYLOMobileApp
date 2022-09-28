import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:xylo/config.dart';
import 'package:xylo/screens/card/card.dart';
import 'package:xylo/screens/category/category.dart';
import 'package:xylo/screens/payment/payment.dart';
import 'package:xylo/screens/shift/shift.dart';
import 'package:xylo/screens/thermal/thermal.dart';

import '../screens/clock/clock.dart';
import '../screens/customer/customer.dart';
import '../screens/bottom_navbar.dart';
import '../screens/order/order.dart';
import '../screens/user/user.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.maxFinite,
      backgroundColor: sideMenuColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: ListView(
          children: [
            buildHead(context),
            const SizedBox(
              height: 20,
            ),
            buildButton(context, label: 'HOME', icon: Icons.home, onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NavBar()));
            }),
            buildButton(context, label: 'CUSTOMER', icon: Icons.group,
                onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomerPage()));
            }),
            buildButton(context, label: 'PAYMENT TYPES', icon: Icons.money,
                onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentPage()));
            }),
            buildButton(context,
                label: 'ORDER TYPES', icon: Icons.shopping_basket, onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OrderPage()));
            }),
            buildButton(context, label: 'CREDIT CARDS', icon: Icons.credit_card,
                onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CardPage()));
            }),
            buildButton(context, label: 'TAX CATEGORY', icon: Icons.category,
                onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoryPage()));
            }),
            buildButton(context, label: 'TERMINAL ID', icon: Icons.print,
                onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThermalPage()));
            }),
            buildButton(context, label: 'SHIFTS', icon: Icons.date_range,
                onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShiftPage()));
            }),
            buildButton(context, label: 'TIME CLOCK', icon: Icons.lock_clock,
                onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ClockPage()));
            }),
            buildButton(context, label: 'USER', icon: Icons.data_usage_sharp,
                onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserPage()));
            }),
            buildButton(context,
                label: 'REPORTS', icon: Icons.report, onTap: () {}),
            buildButton(context,
                label: 'TOOLS', icon: Icons.settings, onTap: () {}),
            buildButton(context, label: 'HELP', icon: Icons.help, onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget buildHead(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Side Menu",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: ResponsiveFlutter.of(context).fontSize(3.8),
              )),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildButton(BuildContext context,
      {String label, IconData icon, Function onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 27,
      ),
      title: Text(
        label,
        style: TextStyle(
            color: Colors.white,
            fontSize: ResponsiveFlutter.of(context).fontSize(2.8),
            fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
