import 'package:xid/xid.dart';
import 'package:xylo/actions/ActionScreen.dart';
import 'package:xylo/model/deals_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DealsActions extends ActionScreen {
  List<DealsData> dashboardItem = [];
  Future getDealsData() async {
    // const url = '5.161.97.142:9001';
    const api = 'discountrules';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var pay in jsonData) {
      bool active = false;
      if (pay['bolActive'] == 1) {
        active = true;
      }
      dashboardItem.add(DealsData(
          pay['txtCode'],
          active,
          pay['bolOnlyformanager'],
          pay['datFromdate'],
          pay['datTodate'],
          pay['dateCreationdate'],
          pay['dblDefaultdiscountvalue'],
          pay['dblMaxdiscountpermanager'],
          pay['dblMaxdiscountperuser'],
          pay['intDeleted'],
          pay['txtName'],
          pay['txtRelatedacccode']));
    }
  }

  String formatDate(String date) {
    String formattedDate = "";
    var dateArr = date.split('-');

    if (dateArr[0].length == 1) {
      dateArr[0] = "0${dateArr[0]}";
    }
    if (dateArr[1].length == 1) {
      dateArr[1] = "0${dateArr[1]}";
    }
    formattedDate = "${dateArr[2]}-${dateArr[1]}-${dateArr[0]}";
    return formattedDate;
  }

  Future insertingDealData(String name, String department, String fromDate,
      String toDate, bool active) async {
    const api = 'discountrules/saverule';
    var xid = Xid();
    var activeFlag = 0;
    if (active) {
      activeFlag = 1;
    }
    fromDate = formatDate(fromDate);
    toDate = formatDate(toDate);
    // var id = xid.toString().substring(0, 7);
    // print(id);
    final response = await http.post(Uri.http(url, api),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({
          "txtCode": xid.toString().substring(0, 7),
          "bolActive": 1,
          "bolOnlyformanager": 0,
          "datFromdate": fromDate,
          "datTodate": toDate,
          "dateCreationdate": null,
          "dblDefaultdiscountvalue": 50.0,
          "dblMaxdiscountpermanager": 0.0,
          "dblMaxdiscountperuser": 0.0,
          "intDeleted": 0,
          "txtName": name,
          "productcatTbl": {
            "txtCode": "IDOqr2otYob01Gh",
            "bolAllowdiscount": 0,
            "datCreationdate": null,
            "intDeleted": 0,
            "txtNamea": department,
            "txtNamee": department,
            "txtPrintername": null,
            "txtUsercode": null,
            "numIsParent": 1,
            "txtParentCode": null,
            "printTo": null,
            "taxCategory": "1",
            "smalllinemodifier": 0,
            "addtopos": 0,
            "showinmob": 0,
            "color": "rgb(255,  0,  0)",
            "priorityindex": "4",
            "age": "0",
            "express": 1,
            "ebt": 0
          }
        }));
    print(response.statusCode);
    // print("$toDate $fromDate");
  } //Here is the insert method
}
