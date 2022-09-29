import 'dart:convert';

import 'package:xid/xid.dart';
import 'package:xylo/actions/ActionScreen.dart';
import 'package:xylo/model/thermal_data.dart';
import 'package:http/http.dart' as http;

class TermActions extends ActionScreen {
  List<ThermalData> thermalData = [];

  Future getTerminalData() async {
    // const url = '5.161.97.142:9001';
    const api = 'terminals';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var term in jsonData) {
      var active = false;
      if (term['active'] == 1) {
        active = true;
      }
      thermalData.add(ThermalData(term['terminalKey'], term['merchantId'],
          term['description'], active));
    }
  }

  Future insertingTermData(
      String key, String merch_id, String description, bool active) async {
    const api = 'terminals/save';
    // var xid = Xid();
    var activeFlag = 0;
    if (active) {
      activeFlag = 1;
    }
    final response = await http.post(Uri.http(url, api),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({
          "terminalKey": key,
          "merchantId": merch_id,
          "description": description,
          "active": activeFlag
        }));
  } //Here is the insert method
}
