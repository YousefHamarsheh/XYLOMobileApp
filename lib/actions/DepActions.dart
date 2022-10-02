import 'dart:convert';

import 'package:xid/xid.dart';
import 'package:xylo/actions/ActionScreen.dart';
import 'package:xylo/model/depart_data.dart';
import 'package:http/http.dart' as http;

class DepActions extends ActionScreen {
  //List Data
  List<DepartItem> departItem = [];

  Future getDepartData() async {
    // const url = '5.161.97.142:9001';
    const api = 'prodcat';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var dep in jsonData) {
      departItem.add(DepartItem(
          dep['txtCode'].toString(),
          dep['txtNamea'].toString(),
          dep['printTo'].toString(),
          dep['txtNamee'].toString(),
          dep['priorityindex'].toString(),
          dep['txtParentCode'].toString(),
          dep['age'].toString(),
          // cust['txtAddresse'].toString(),
          "assets/images/burger.png",
          dep['color'].toString(),
          dep['taxCategory'].toString(),
          dep['addtopos'],
          dep['showinmob'],
          dep['ebt'],
          dep['smalllinemodifier'],
          dep['express']));
      // print(cust['txtName'] + " " + cust['txtCode'].toString() + "\n");
    }
  }

  Future<String> insertingDepData(
      String depName,
      String printTo,
      String depDisplay,
      String priortyIndex,
      String depParent,
      String taxCategory,
      String age,
      String color,
      List<bool> bArray) async {
    //bArray -> 0:Show in POS, 1:Show in MOB APP, 2:EBT Eligible, 3:Modifyer, 4:Express Button
    const api = 'prodcat/save';
    var xid = Xid();
    String id = xid.toString().substring(0, 7);
    var showInPos = 0;
    var showInMob = 0;
    var ebtEligible = 0;
    var modifyer = 0;
    var expressBtn = 0;
    if (bArray[0]) {
      showInPos = 1;
    }
    if (bArray[1]) {
      showInMob = 1;
    }
    if (bArray[2]) {
      ebtEligible = 1;
    }
    if (bArray[3]) {
      modifyer = 1;
    }
    if (bArray[4]) {
      expressBtn = 1;
    }
    if (color.compareTo("Red") == 0) {
      color = "#FF0000";
    }
    final response = await http.post(Uri.http(url, api),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({
          "txtCode": id,
          "bolAllowdiscount": 0,
          "datCreationdate": null,
          "intDeleted": 0,
          "txtNamea": depName,
          "txtNamee": depDisplay,
          "txtPrintername": null,
          "txtUsercode": null,
          "numIsParent": 1,
          "txtParentCode": depParent,
          "printTo": printTo,
          "taxCategory": taxCategory,
          "smalllinemodifier": modifyer,
          "addtopos": showInPos,
          "showinmob": showInMob,
          "color": color,
          "priorityindex": priortyIndex.substring(0, age.indexOf(" ")),
          "age": age.substring(0, age.indexOf(" ")),
          "express": expressBtn,
          "ebt": ebtEligible
        }));
    // print(response.statusCode);
    return id;
  }

  Future insertDepImage(String id, String blobImage) async {
    const api = 'productcatimage/save';
    final response = await http.post(Uri.http(url, api),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode(
            {"txtStkcode": id, "blobImage": blobImage, "txtPath": null}));

    // print(response.statusCode);
  }
}
