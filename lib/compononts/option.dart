import 'package:flutter/material.dart';

import '../config.dart';

class OptionButton extends StatelessWidget {
  Function onPress;
  double padding;
  OptionButton({Key? key, required this.onPress, this.padding = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12, bottom: padding),
      child: InkWell(
        onTap: () => onPress(),
        child: const CircleAvatar(
            radius: 14,
            backgroundColor: kPrymeryColor1,
            child: Icon(
              Icons.more_vert,
              color: Colors.black45,
            )),
      ),
    );
  }
}
