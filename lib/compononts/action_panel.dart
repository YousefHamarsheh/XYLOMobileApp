import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:xylo/compononts/delete_alert.dart';

import '../config.dart';

class BottomActionPanel extends StatelessWidget {
  final Function()? tranceactionOnTap;
  final Function()? editOnTap;
  final Function()? boxOnTap;
  final Function()? viewOnTap;
  final Function()? deleteOnTap;
  final String name;
  final String text;
  const BottomActionPanel(
      {Key? key,
      this.tranceactionOnTap,
      this.boxOnTap,
      required this.name,
      required this.text,
      this.editOnTap,
      this.deleteOnTap,
      this.viewOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: (boxOnTap== null && tranceactionOnTap==null) ? screenHeight* 0.35: screenHeight* 0.40,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Text("Apply Actions",
                  style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(3.2),
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 15,
            ),
            Visibility(
              visible: tranceactionOnTap != null || boxOnTap != null,
              child: ListTile(
                leading: Icon(
                  tranceactionOnTap == null ? Icons.add_box : Icons.list_alt,
                  size: 30,
                  color: kPrymeryColor2,
                ),
                title: Text(
                  tranceactionOnTap == null ? "In Box" : "Transactions",
                  style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                      fontWeight: FontWeight.w400,
                      color: kPrymeryColor2),
                ),
                onTap: tranceactionOnTap ?? boxOnTap,
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
            ),
            ListTile(
              onTap: editOnTap,
              leading: const Icon(
                Icons.edit,
                size: 30,
                color: kPrymeryColor2,
              ),
              title: Text(
                "Edit",
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                    fontWeight: FontWeight.w400,
                    color: kPrymeryColor2),
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
            ),
            ListTile(
              onTap: viewOnTap,
              leading: const Icon(
                Icons.visibility,
                size: 30,
                color: kPrymeryColor2,
              ),
              title: Text(
                "View",
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                    fontWeight: FontWeight.w400,
                    color: kPrymeryColor2),
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
            ),
            ListTile(
              onTap: deleteOnTap,
              leading: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 30,
              ),
              title: Text(
                "Delete",
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                    fontWeight: FontWeight.w400,
                    color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
