import 'package:flutter/material.dart';

import '../config.dart';

class FiltterButton extends StatelessWidget {
  Function() onPress;
  FiltterButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: 50,
        height: 50,
        // ignore: deprecated_member_use
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: kPrymeryColor1,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
          ),
          onPressed: onPress,
          child: const Icon(
            Icons.filter_list_outlined,
            color: textheadlinecolor,
          ),
        ),
      ),
    );
  }
}
