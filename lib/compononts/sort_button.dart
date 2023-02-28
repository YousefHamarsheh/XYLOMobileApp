import 'package:flutter/material.dart';

import '../config.dart';

class SortButton extends StatelessWidget {
  final Function onPress;
  const SortButton({Key key, @required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: SizedBox(
        width: 50,
        height: 50,
        // ignore: deprecated_member_use
        child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            primary: kPrymeryColor1,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7))),
          ),
          child: const Icon(
            Icons.short_text,
            color: textheadlinecolor,
          ),
        ),
      ),
    );
  }
}
