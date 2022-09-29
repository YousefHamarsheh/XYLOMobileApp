import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xylo/actions/ActionScreen.dart';
import 'package:xylo/model/shift_data.dart';
import 'package:http/http.dart' as http;

class ShiftActions extends ActionScreen {
  List<ShiftData> shiftData = [];

  Future getShiftData() async {
    // const url = '5.161.97.142:9001';
    const api = 'cashopenclose';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var shift in jsonData) {
      var status = "Closed";
      if (shift['intStatus'] == 1) {
        status = "Opened";
      }
      shiftData.add(ShiftData(
          shift['txtKey'],
          shift['datClosedate'],
          shift['datCreationdate'],
          shift['datOpendate'],
          shift['dblLeftamount'],
          shift['dblRevolvils'],
          shift['dblRevolvjod'],
          shift['dblRevolvusa'],
          shift['intClosetype'],
          shift['intHoldstatus'],
          shift['intShiftcode'],
          status,
          shift['timClosetime'],
          shift['timOpentime'],
          shift['txtBranchcode'],
          shift['txtComments'],
          shift['txtIpaddress'],
          shift['txtUsercode'],
          shift['txtUsername']));
    }
  }
}
