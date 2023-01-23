import 'package:flutter/material.dart';

import '../config.dart';

class CustomDropDown extends StatelessWidget {
  List<String> items;
  String value;
  ValueChanged<dynamic> onChanged;
  String? hint;
  bool editatbale;
  CustomDropDown(
      {Key? key,
      required this.items,
      required this.value,
      required this.onChanged,
      this.hint,
      this.editatbale = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        value: value,
        onChanged: editatbale
            ? (newValue) {
                onChanged(newValue);
              }
            : null,
        decoration: InputDecoration(
          hintText: hint ?? hint,
          enabled: editatbale,
          hintStyle: const TextStyle(
            color: kPrymeryColor2,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: textheadlinecolor),
            borderRadius: BorderRadius.all(
              Radius.circular(7.0),
            ),
          ),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style: const TextStyle(
                  color: kPrymeryColor2,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
          );
        }).toList());
  }
}
