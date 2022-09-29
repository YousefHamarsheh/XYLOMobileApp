import 'dart:convert';

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

  Future insertingTermData() async {} //Here is the insert method
}
