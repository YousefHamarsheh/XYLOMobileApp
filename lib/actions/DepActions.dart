import 'dart:convert';

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
}
