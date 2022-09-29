import 'package:xylo/actions/ActionScreen.dart';
import 'package:xylo/model/clock_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClockActions extends ActionScreen {
  List<ClockData> clockData = [];

  Future getClockData() async {
    // const url = '5.161.97.142:9001';
    const api = 'clocks';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var clk in jsonData) {
      var status = "Out";
      if (clk['status'] == 1) {
        status = "In";
      }

      clockData.add(ClockData(clk['userCode'], clk['userCode'], clk['fromtime'],
          clk['date'], clk['deviceName'], status, clk['toTime'], clk['notes']));
    }
  }
}
