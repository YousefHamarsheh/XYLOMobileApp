import 'package:flutter/material.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';

import '../config.dart';

class BottomBar extends StatelessWidget {
  final Function() addButtonAction;
  final bool isEdit;
  const BottomBar(
      {Key? key, required this.addButtonAction, this.isEdit = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kPrymeryColor1,
        borderRadius: BorderRadius.vertical(top: Radius.circular(5.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildCancelbtn(context),
          const SizedBox(
            width: 5,
          ),
          buildAddbtn(context, addButtonAction, isEdit),
        ],
      ),
    );
  }
}

Widget buildCancelbtn(BuildContext context) {
  double width = ((MediaQuery.of(context).size.width) - 70) / 2;
  return Center(
    child: SizedBox(
        width: width,
        height: 50,
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: kPrymeryColor1,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: TextStyle(
              color: Colors.grey,
              // fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
              fontWeight: FontWeight.w500,
            ),
          ),
        )),
  );
}

Widget buildAddbtn(BuildContext context, Function() onPress, bool isEdit) {
  double width = ((MediaQuery.of(context).size.width) - 70) / 2;
  return Center(
    child: SizedBox(
        width: width,
        height: 50,
        child: TextButton(
          onPressed: onPress,
          child: Text(
            isEdit ? "Edit" : "ADD",
            style: TextStyle(
              color: Colors.white,
              // fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
              fontWeight: FontWeight.w500,
            ),
          ),
        )),
  );
}
