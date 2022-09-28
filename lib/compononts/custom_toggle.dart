import 'package:flutter/material.dart';
import 'package:xylo/config.dart';

class CustomToggle extends StatefulWidget {
  int index;
  bool enabeld;
  CustomToggle({Key key, @required this.index, this.enabeld = true})
      : super(key: key);

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: textheadlinecolor, width: 3),
        borderRadius: BorderRadius.circular(36),
      ),
      child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: widget.enabeld
                      ? () {
                          setState(() {
                            widget.index = 0;
                          });
                        }
                      : null,
                  child: CircleAvatar(
                    backgroundColor:
                        widget.index == 0 ? kPrymeryColor2 : Colors.transparent,
                    child: Text(
                      "ON",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color:
                              widget.index == 0 ? Colors.white : Colors.grey),
                    ),
                  ),
                ),
                widget.index == 1
                    ? InkWell(
                        onTap: widget.enabeld
                            ? () {
                                setState(() {
                                  widget.index = 1;
                                });
                              }
                            : null,
                        child: const CircleAvatar(
                          backgroundColor: textheadlinecolor,
                          child: Text(
                            "INHERIT",
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                                color: Colors.white),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: widget.enabeld
                            ? () {
                                setState(() {
                                  widget.index = 1;
                                });
                              }
                            : null,
                        child: const Text(
                          "INHERIT",
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: textheadlinecolor),
                        ),
                      ),
                InkWell(
                  onTap: widget.enabeld
                      ? () {
                          setState(() {
                            widget.index = 2;
                          });
                        }
                      : null,
                  child: CircleAvatar(
                    backgroundColor:
                        widget.index == 2 ? Colors.grey : Colors.transparent,
                    child: Text(
                      "OFF",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color:
                              widget.index == 2 ? Colors.white : Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
