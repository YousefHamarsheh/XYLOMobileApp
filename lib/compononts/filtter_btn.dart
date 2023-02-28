import 'package:flutter/material.dart';

import '../config.dart';

class FiltterButton extends StatelessWidget {
  final Function onPress;
  const FiltterButton({Key key, @required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
            Icons.filter_list_outlined,
            color: textheadlinecolor,
          ),
        ),
      ),
    );
  }
}
