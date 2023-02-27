// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

class AlertDelete extends StatelessWidget {
  final String name, id;
  const AlertDelete({Key key, @required this.name, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Icon(
              Icons.delete,
              color: Colors.red,
              size: 80,
            ),
          ),
          Text(
            "Do You Want To Delete\nThis $name",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kPrymeryColor2,
              fontWeight: FontWeight.bold,
              fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: id != "" ? 32 : 0, bottom: 54),
            child: Visibility(
              visible: id != null,
              child: Text(
                id ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textheadlinecolor,
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      height: 50,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "NO, CANCEL",
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(1.8)),
                      )),
                ),
                const SizedBox(
                  width: 4,
                ),
                SizedBox(
                  child: FlatButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      height: 50,
                      onPressed: () async {
                        var url = Uri.parse(
                            'http://5.161.97.142:9001/cust/delete/$id');
                        // print('5.161.97.142:9001/cust/delete/$text');
                        var response = await http.post(url);

                        print(response.statusCode);
                        if (response.statusCode == 200) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('$id deleted successfully'),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('$id has not been deleted'),
                              backgroundColor: Colors.blueGrey,
                            ),
                          );
                        }
                      },
                      child: Text(
                        "YES, DELETE",
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(1.8)),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
