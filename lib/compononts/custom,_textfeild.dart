import 'package:flutter/material.dart';

import '../config.dart';

class CustomTextFeild extends StatelessWidget {
  final String hint;
  final TextInputType textInputType;
  final Function onValidator;
  TextEditingController controller = TextEditingController();
  bool editatbale;
  int maxLLine;
  CustomTextFeild(
      {Key key,
      this.hint,
      this.textInputType,
      this.onValidator,
      this.maxLLine = 1,
      this.editatbale = true,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: onValidator == null ? null : onValidator(),
      maxLines: maxLLine,
      enabled: editatbale,
      style: const TextStyle(
          color: kPrymeryColor2, fontWeight: FontWeight.bold, fontSize: 18),
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              color: kPrymeryColor2, fontWeight: FontWeight.bold, fontSize: 18),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: textheadlinecolor),
            borderRadius: BorderRadius.all(
              Radius.circular(7.0),
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45),
            borderRadius: BorderRadius.all(
              Radius.circular(7.0),
            ),
          )),
    );
  }
}
